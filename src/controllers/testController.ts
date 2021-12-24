import { Request, Response, NextFunction } from "express";
import formidable from "formidable";
import fs from "fs";

import * as testService from "../services/testService";

const getTestNeededInfo = async (
  req: Request,
  res: Response,
  next: NextFunction
) => {
  const courseId: number = Number(req.params.courseId);

  if (!courseId || courseId < 0 || isNaN(courseId)) return res.sendStatus(400);
  try {
    const info = await testService.getTestNeededInfo(courseId);

    return res.send(info);
  } catch (error) {
    next(error);
  }
};

const uploadTest = async (req: Request, res: Response, next: NextFunction) => {
  const form = formidable({
    multiples: false,
  });

  try {
    form.parse(req, async (err, fields, files: any) => {
      const courseId: number = Number(fields.courseId);
      const professorId: number = Number(fields.professorId);
      const subjectId: number = Number(fields.subjectId);
      const typeId: number = Number(fields.typeId);
      const period: string = JSON.stringify(fields.period)
        .replace('"', "")
        .replace('"', "");

      if (
        !professorId ||
        professorId < 1 ||
        !subjectId ||
        subjectId < 1 ||
        !period ||
        !typeId ||
        typeId < 1 ||
        !courseId ||
        courseId < 1
      )
        return res.sendStatus(400);

      const check = await testService.checkTestParams(
        courseId,
        professorId,
        subjectId
      );

      if (!check) return res.sendStatus(404);

      const file = fs.readFileSync(files.file.filepath);
      const filename = files.file.newFilename;
      const fileUrl = await testService.uploadTest(file, filename);

      await testService.registerTestOnDatabase(
        fileUrl,
        courseId,
        professorId,
        subjectId,
        typeId,
        period
      );

      if (err) {
        return next(err);
      }

      return res.sendStatus(200);
    });
  } catch (error) {
    next(error);
  }
};

export { getTestNeededInfo, uploadTest };

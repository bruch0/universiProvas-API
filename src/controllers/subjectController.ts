import { Request, Response, NextFunction } from "express";
import * as subjectService from "../services/subjectService";

const getCourseSubjects = async (
  req: Request,
  res: Response,
  next: NextFunction
) => {
  const universityId = Number(req.params.universityId);
  const courseId = Number(req.params.courseId);

  if (!universityId || universityId < 1)
    return res.status(400).send("Universidade inválida");

  const subjects = await subjectService.getCourseSubjects(
    universityId,
    courseId
  );

  return res.send(subjects);
};

export { getCourseSubjects };

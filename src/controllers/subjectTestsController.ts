import { Request, Response, NextFunction } from "express";
import * as subjectTestsService from "../services/subjectTestsService";

const getSubjectTests = async (
  req: Request,
  res: Response,
  next: NextFunction
) => {
  const subjectId = Number(req.params.subjectId);
  const universityId = Number(req.params.universityId);

  if (
    !subjectId ||
    subjectId < 1 ||
    !universityId ||
    universityId < 1 ||
    isNaN(universityId) ||
    isNaN(subjectId)
  )
    return res.status(400).send("Universidade e/ou matéria inválidos");

  try {
    const subjectTests = await subjectTestsService.getSubjectTests(
      universityId,
      subjectId
    );

    return res.send(subjectTests);
  } catch (error) {
    next(error);
  }
};

export { getSubjectTests };

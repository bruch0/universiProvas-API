import { Request, Response, NextFunction } from "express";
import * as subjectTestsService from "../services/subjectTestsService";

const getProfessorTests = async (
  req: Request,
  res: Response,
  next: NextFunction
) => {
  const subjectId = Number(req.params.subjectId);
  const universityId = Number(req.params.universityId);

  if (!subjectId || subjectId < 1 || !universityId || universityId < 1)
    return res.status(400).send("Parâmetros inválidos");

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

export { getProfessorTests };
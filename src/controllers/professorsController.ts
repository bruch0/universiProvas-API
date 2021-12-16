import { Request, Response, NextFunction } from "express";
import * as professorsService from "../services/professorService";

const getUniversityProfessors = async (
  req: Request,
  res: Response,
  next: NextFunction
) => {
  const universityId = Number(req.params.universityId);
  const courseId = Number(req.params.courseId);

  if (!universityId || universityId < 1)
    return res.status(400).send("Universidade inválida");

  const universities = await professorsService.getUniversityProfessors(
    universityId,
    courseId
  );

  return res.send(universities);
};

export { getUniversityProfessors };

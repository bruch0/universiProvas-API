import { Request, Response, NextFunction } from "express";
import * as professorsService from "../services/professorService";

const getUniversityProfessors = async (
  req: Request,
  res: Response,
  next: NextFunction
) => {
  const universityId = Number(req.params.universityId);
  const courseId = Number(req.params.courseId);

  if (
    !universityId ||
    universityId < 1 ||
    universityId > 69 ||
    !courseId ||
    courseId < 1 ||
    courseId > 321 ||
    isNaN(courseId) ||
    isNaN(universityId)
  )
    return res.status(400).send("Universidade e/ou curso inválidos");

  try {
    const universities = await professorsService.getUniversityProfessors(
      universityId,
      courseId
    );

    return res.send(universities);
  } catch (error) {
    next(error);
  }
};

export { getUniversityProfessors };

import { Request, Response, NextFunction } from "express";
import * as courseService from "../services/courseService";

const getCoursesByUniversity = async (
  req: Request,
  res: Response,
  next: NextFunction
) => {
  const universityId = Number(req.params.universityId);

  if (!universityId || universityId < 1 || isNaN(universityId))
    return res.status(400).send("Universidade inválida");

  if (universityId > 69)
    return res.status(404).send("Universidade não encontrada");

  try {
    const universities = await courseService.getCoursesByUniversity(
      universityId
    );

    return res.send(universities);
  } catch (error) {
    next(error);
  }
};

export { getCoursesByUniversity };

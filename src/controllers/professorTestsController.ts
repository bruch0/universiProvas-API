import { Request, Response, NextFunction } from "express";
import * as professorTestsService from "../services/professorTestsService";

const getProfessorTests = async (
  req: Request,
  res: Response,
  next: NextFunction
) => {
  const professorId = Number(req.params.professorId);

  if (!professorId || professorId < 1 || isNaN(professorId))
    return res.status(400).send("Professor inválido");

  try {
    const professorTests = await professorTestsService.getProfessorTests(
      professorId
    );

    return res.send(professorTests);
  } catch (error) {
    next(error);
  }
};

export { getProfessorTests };

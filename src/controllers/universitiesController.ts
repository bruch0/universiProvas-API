import { Request, Response, NextFunction } from "express";
import * as universityService from "../services/universitiesService";

const getUniversities = async (
  req: Request,
  res: Response,
  next: NextFunction
) => {
  try {
    const universities = await universityService.getUniversities();

    return res.send(universities);
  } catch (error) {
    next(error);
  }
};

export { getUniversities };

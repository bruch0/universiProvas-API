import { Request, Response, NextFunction } from "express";
import * as testService from "../services/testService";

const getCourseSubjects = async (
  req: Request,
  res: Response,
  next: NextFunction
) => {
  const info = await testService.getTestNeededInfo();

  return res.send(info);
};

export { getCourseSubjects };

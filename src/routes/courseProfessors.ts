import express from "express";
import * as professorsController from "../controllers/courseProfessorsController";

const router = express.Router();

router.get(
  "/professors/:universityId/:courseId",
  professorsController.getUniversityProfessors
);

export default router;

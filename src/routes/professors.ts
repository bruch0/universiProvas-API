import express from "express";
import * as professorsController from "../controllers/professorsController";

const router = express.Router();

router.get(
  "/professors/:universityId/:courseId",
  professorsController.getUniversityProfessors
);

export default router;

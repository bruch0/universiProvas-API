import express from "express";
import * as professorsTestsController from "../controllers/professorTestsController";

const router = express.Router();

router.get(
  "/professors/:professorId",
  professorsTestsController.getProfessorTests
);

export default router;

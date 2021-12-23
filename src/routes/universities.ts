import express from "express";
import * as universityController from "../controllers/universitiesController";

const router = express.Router();

router.get("/universities", universityController.getUniversities);

export default router;

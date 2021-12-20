import express from "express";
import cors from "cors";
import "reflect-metadata";

import connectDatabase from "./database/database";
import universityRoute from "./routes/universities";
import coursesRoute from "./routes/courses";
import professorsRoute from "./routes/professors";
import professorTestsRoute from "./routes/professorTests";
import subjectsRouter from "./routes/subjects";
import testRouter from "./routes/tests";
import subjectTestsRoute from "./routes/subjectTests";

import errorRoute from "./middlewares/errorRoute";
import inexistentRoute from "./routes/inexistentRoute";

const app = express();
app.use(express.json());
app.use(cors());

app.use(universityRoute);
app.use(coursesRoute);
app.use(professorsRoute);
app.use(professorTestsRoute);
app.use(subjectsRouter);
app.use(subjectTestsRoute);
app.use(testRouter);

app.use(errorRoute);
app.use(inexistentRoute);

export async function init() {
  await connectDatabase();
}

export default app;

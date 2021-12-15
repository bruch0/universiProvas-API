import express from "express";
import cors from "cors";
import "reflect-metadata";

import connectDatabase from "./database/database";
import universityRoute from "./routes/university";
import errorRoute from "./middlewares/errorRoute";
import inexistentRoute from "./routes/inexistentRoute";

const app = express();
app.use(express.json());
app.use(cors());

app.use(universityRoute);

app.use(errorRoute);
app.use(inexistentRoute);

export async function init() {
  await connectDatabase();
}

export default app;

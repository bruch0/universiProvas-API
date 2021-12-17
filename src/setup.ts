import dotenv from "dotenv";

let envFile;

if (process.env.NODE_ENV === "test") {
  envFile = ".env.test";
} else if (process.env.NODE_ENV === "dev") {
  envFile = ".env.dev";
}

dotenv.config({
  path: envFile,
});

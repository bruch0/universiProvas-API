import "./setup";
import { getConnectionManager } from "typeorm";

if (
  process.env.NODE_ENV === "prod" &&
  process.env.DATABASE_URL.indexOf("sslmode=require") === -1
) {
  process.env.DATABASE_URL += "?sslmode=require";
}

console.log(process.env);

export default async function connect() {
  const connectionManager = await getConnectionManager();
  const connection = connectionManager.create({
    name: "default",
    type: "postgres",
    url: process.env.DATABASE_URL,
    entities: [
      `${process.env.NODE_ENV === "prod" ? "dist/src" : "src"}/entities/*.*`,
    ],
    ssl: process.env.NODE_ENV === "prod",
  });
  await connection.connect();
  return connection;
}

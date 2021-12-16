import { getConnectionManager } from "typeorm";

export default async function connect() {
  const connectionManager = await getConnectionManager();
  const connection = connectionManager.create({
    name: "default",
    type: "postgres",
    url: "postgres://postgres:123456@localhost:5432/universiprovas",
    entities: ["src/entities/*.ts"],
  });
  await connection.connect();

  return connection;
}

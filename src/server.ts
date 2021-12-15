import "./setup";
import app, { init } from "./app";

init().then(() => {
  app.listen(process.env.PORT);
});

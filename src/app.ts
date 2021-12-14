import express from 'express';
import cors from 'cors';

import inexistentRoute from './middlewares/inexistentRoute'

const app = express();
app.use(express.json());
app.use(cors());


app.use(inexistentRoute);

export default app;

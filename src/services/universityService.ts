import { getRepository } from "typeorm";
import { Universities } from "../entities/university";

const getUniversities = async () => {
  const universities = await getRepository(Universities).find();

  return universities;
};

export { getUniversities };

import AWS from "aws-sdk";
import { x } from "joi";

const uploadFileS3 = async (file: any, filename: string) => {
  const s3 = new AWS.S3({
    accessKeyId: process.env.ACCESS_KEY_ID,
    secretAccessKey: process.env.SECRET_KEY,
  });

  const params = {
    Bucket: "universiprova",
    Key: `${filename}.pdf`,
    Body: file,
    ContentType: "file/PDF",
  };

  const location = s3
    .upload(params, async (err: any, data: any) => {})
    .promise()
    .then((data) => data.Location);

  return location;
};

export { uploadFileS3 };

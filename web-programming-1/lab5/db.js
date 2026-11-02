import pg from "pg";
const { Pool } = pg;
import { config } from "./config.js";

const { host, port, user, password, database } = config;

export const pool = new Pool({
  host,
  port,
  user,
  password,
  database,
  max: 10,
  idleTimeoutMillis: 30000,
  connectionTimeoutMillis: 2000,
});

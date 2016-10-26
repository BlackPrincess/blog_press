import * as StringUtil from "string_util"

export function camelizeKey(data) {
  if (!data || typeof data !== 'object') return data;

  const res = Array.isArray(data) ? [] : {};
  Object.keys(data).forEach((key) => {
    res[StringUtil.camelize(key)] = camelizeKey(data[key]);
  });

  return res;
}

export function underscoreKey(data) {
  if (!data || typeof data !== 'object') return data;

  const res = Array.isArray(data) ? [] : {};
  Object.keys(data).forEach((key) => {
    res[StringUtil.underscore(key)] = underscoreKey(data[key]);
  });

  return res;
}

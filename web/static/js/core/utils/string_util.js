export function camelize(str) {
  const _str = str.split("_").filter((a) => a.length !== 0).map((a) => {
    const [x, ...xs] = a
    return x.toUpperCase() + xs.map((a) => a.toLowerCase()).join("")
  })
  
  const [x, ...xs] = _str
  return x.toLowerCase() + xs.join("")
}

export function underscore(str) {
  return str.replace(/([A-Z])/g, (_, char) => `_${char.toLowerCase()}`)
}

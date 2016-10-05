export default {
  sidemenus: state => {
    return [
      {name: 'taxon 1'},
      {name: 'taxon 2'},
      {name: 'taxon 3'}
    ]
  },
  newArticles: state => {
    return [
      {id: 1, permalink: 'first', title: 'title here'}
    ]
  }
}

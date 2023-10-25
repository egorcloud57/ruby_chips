// Паралелизм не работает без апи

let a = 'hello'

console.log(a)

let promise = new Promise(function(resolve, reject) {
  // let a
  for (let index = 0; index < 1000000000; index++) {
    if(index == 1000000) {
      resolve('привет')
    }
  }
  // resolve(a)
})

let promise2 = new Promise(function(resolve, reject) {
  // let a
  for (let index = 0; index < 1000000000; index++) {
    if(index == 10000) {
      resolve('мир')
    }
  }
  // resolve(a)
})


promise.then(res => { console.log(res) })
promise2.then(res => { console.log(res) })
console.log(a + 'world')

// Паралелизм работает ток с апи

let b = 'hello'

console.log(b)

let promise_async = new Promise(function(resolve, reject) {
  setTimeout(() => {
    resolve('привет')
  }, 5000)
})

let promise_async_2 = new Promise(function(resolve, reject) {
  setTimeout(() => {
    resolve('мир')
  }, 2000)
})


promise_async.then(res => { console.log(res) })
promise_async_2.then(res => { console.log(res) })
console.log(b + 'world')

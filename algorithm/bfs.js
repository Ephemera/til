// http://blog.eairship.kr/269 참고

var data = [[]]; // 주어진 도로
var result = 25; // 경로의 최종 길이
var result_path = [];
 
function solve(x, y, q) {
  if (x === 5 && y === 5) {
    if (result > q.length) {
      result_path = Array.prototype.slice.apply(q);
      result = q.length;
    }
  }

  // 차이는 없지만 분기문 네 번 태우기 싫어서...
  var select = [
    [x-1, y],
    [x+1, y],
    [x, y-1],
    [x, y+1]
  ];

  select.forEach(function(s) {
    var _x = s[0],
        _y = s[1];

    if ((data[_x]||[])[_y]) {
      data[_x][_y] = 0;
      q.push(_x + ',' + _y);
      solve(_x, _y, q);
      // 한 경로를 끝까지 도달한 이후 예전 상태로 복구
      q.pop();
      data[_x][_y] = 1;
    }
  })
}


function init(input) {
  var _in = input.trim().split('\n')
  var N = +_in.shift(); 
  data = _in.map((d) => { return d.split(' ').map(Number) });

  var Q = ['0,0']
  data[0][0] = 0;
  solve(0, 0, Q);
  console.log('최단경로길이:', result);
  console.log('최단경로:', result_path);
}

// read from stdin
process.stdin.resume();
process.stdin.setEncoding('ascii');
var _input = '';
process.stdin.on('data', function (input) {
  _input += input;
});
process.stdin.on('end', function () {
  init(_input);
});

// input:
// 6
// 1 1 1 1 1 1
// 0 0 1 0 0 1
// 1 1 1 0 1 1
// 1 0 0 0 1 0
// 1 1 1 0 1 0
// 0 0 1 1 1 1



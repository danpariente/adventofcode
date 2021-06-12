'use strict';

const deliveredAt = (directions) => {
  return directions.reduce((floor, currentDirection) => {
    floor + (currentDirection === '(' ? 1 : -1);
  }, 0);
}

module.exports = deliveredAt;

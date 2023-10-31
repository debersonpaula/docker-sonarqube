export function calculateAverage(numbers: number[]): number {
  if (numbers.length === 0) {
    throw new Error("Cannot calculate average of an empty array");
  }

  const sum = numbers.reduce((acc, val) => acc + val, 0);
  return sum / numbers.length;
}

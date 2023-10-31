import { calculateAverage } from "./calculateAverage";

describe("calculateAverage", () => {
  it("calculates average correctly for an array of positive numbers", () => {
    const input = [1, 2, 3, 4, 5];
    const result = calculateAverage(input);
    expect(result).toBe(3);
  });

  it("calculates average correctly for an array of negative numbers", () => {
    const input = [-1, -2, -3, -4, -5];
    const result = calculateAverage(input);
    expect(result).toBe(-3);
  });

  it("throws an error for an empty array", () => {
    const input: number[] = [];
    expect(() => calculateAverage(input)).toThrowError(
      "Cannot calculate average of an empty array"
    );
  });
});

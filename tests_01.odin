package test

import "core:fmt"
import "core:math"
print :: fmt.println


main :: proc() {

	print(minEatingSpeed(piles = []int{3, 6, 7, 11}, h = 8))
	print(minEatingSpeed(piles = []int{30, 11, 23, 4, 20}, h = 5))
	print(minEatingSpeed(piles = []int{30, 11, 23, 4, 20}, h = 6))

	// OUTPUT:
	// 4
	// 30
	// 23
}

minEatingSpeed :: proc(piles: []int, h: int) -> int {

	feasible :: proc(speed: int, piles: []int, h: int) -> bool {
		// can you eat all of it with this speed
		local_array := make([dynamic]int)
		defer delete(local_array)

		for val in piles {
			time_to_eat := int(math.ceil_f32(f32(val) / f32(speed)))
			append(&local_array, time_to_eat)
		}

		return sum_iterable(local_array[:]) <= h
	}


	// fundamental binary search algorithm
	left, right := 1, max_iterable(piles[:])
	for left < right {
		mid := left + (right - left) / 2
		if feasible(mid, piles, h) {
			right = mid
		} else {
			left = mid + 1
		}
	}
	return left
}

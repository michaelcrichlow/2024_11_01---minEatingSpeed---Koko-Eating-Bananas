import math


def minEatingSpeed(piles: list[int], h: int) -> int:

    def feasible(speed) -> bool:
        # can you eat all of it with this speed
        local_array = []
        for val in piles:
            time_to_eat = math.ceil(val / speed)
            local_array.append(time_to_eat)

        return sum(local_array) <= h

        # return sum(math.ceil(pile / speed) for pile in piles) <= h  # slower
        # return sum((pile - 1) / speed + 1 for pile in piles) <= h  # faster

    # fundamental binary search algorithm
    left, right = 1, max(piles)
    while left < right:
        mid = left + (right - left) // 2
        if feasible(mid):
            right = mid
        else:
            left = mid + 1
    return left


def main() -> None:
    print(minEatingSpeed(piles=[3, 6, 7, 11], h=8))  # 4
    print(minEatingSpeed(piles=[30, 11, 23, 4, 20], h=5))  # 30
    print(minEatingSpeed(piles=[30, 11, 23, 4, 20], h=6))  # 23


if __name__ == '__main__':
    main()

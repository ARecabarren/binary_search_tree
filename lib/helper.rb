def merge_sort(array, len = array.length)
    return array if len <= 1
    
    mid = len / 2

    # Sort left half
    sorted_left = merge_sort(array[0...mid])
    # Sort right hald
    sorted_right = merge_sort(array[mid..-1])

    # Merge sorted halfs
    merge(sorted_left, sorted_right)
end

def merge(left_half, right_half)
    result = []
    right_index = 0
    left_index = 0

    while left_index < left_half.length && right_index < right_half.length
        
        if left_half[left_index] < right_half[right_index]
            result << left_half[left_index]
            left_index += 1
        else
            result << right_half[right_index]
            right_index += 1
        end

    end

    result.concat(left_half[left_index..-1])
    result.concat(right_half[right_index..-1])

    result
end

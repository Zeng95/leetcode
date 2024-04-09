from typing import Optional


class ListNode:
    def __init__(self, val=0, next=None):
        self.val = val
        self.next = next


# Solution 1
class Solution:
    def frequenciesOfElements(self, head: Optional[ListNode]) -> Optional[ListNode]:
        count = {}
        current = head
        while current:
            if current.val in count:
                count[current.val] += 1
            else:
                count[current.val] = 1
            current = current.next

        new_head = ListNode(0)
        current = new_head
        for frequency in count.values():
            current.next = ListNode(frequency)
            current = current.next

        return new_head.next

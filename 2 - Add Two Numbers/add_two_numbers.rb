# Definition for singly-linked list.
class ListNode
  attr_accessor :val, :next
  def initialize(val)
    @val = val
    @next = nil
  end
end

def make_matching_length(l1, l2)
  firstCurrentNode = l1
  secondCurrentNode = l2

  while !firstCurrentNode.nil? || !secondCurrentNode.nil?
    if firstCurrentNode.nil? && !secondCurrentNode.nil?
      firstCurrentNode = ListNode.new(0)
    elsif secondCurrentNode.nil? && !firstCurrentNode.nil?
      p l2
      secondCurrentNode = ListNode.new(0)
      p l2
    end

    firstCurrentNode = firstCurrentNode.next
    secondCurrentNode = secondCurrentNode.next
  end

  {:l1 => l1, :l2 => l2}
end

# @param {ListNode} l1
# @param {ListNode} l2
# @return {ListNode}
def add_two_numbers(l1, l2)
  matching_length = make_matching_length(l1, l2)

  firstCurrentNode = matching_length[:l1]
  secondCurrentNode = matching_length[:l2]

  carryOverValue = 0

  resultingDigits = []

  while !firstCurrentNode.nil? || !secondCurrentNode.nil?
    firstVal = firstCurrentNode.val
    secondVal = secondCurrentNode.val

    sumOfDigits = firstVal + secondVal + carryOverValue
    currentDigit = sumOfDigits % 10

    if sumOfDigits >= 10
      carryOverValue = 1
    end

    resultingDigits.push(currentDigit)

    firstCurrentNode = firstCurrentNode.next
    secondCurrentNode = secondCurrentNode.next
  end

  resultListNode = ListNode.new(nil)
  currentListNode = resultListNode

  for i in 0..(resultingDigits.length - 1)
    currentListNode.val = resultingDigits[i]
    currentListNode.next = ListNode.new(nil)
    currentListNode = currentListNode.next
  end

  resultListNode
end

firstListNode = ListNode.new(2)
firstListNode.next = ListNode.new(4)
firstListNode.next.next = ListNode.new(3)
firstListNode.next.next.next = ListNode.new(3)

secondListNode = ListNode.new(5)
secondListNode.next = ListNode.new(6)
secondListNode.next.next = ListNode.new(4)

resultListNode = add_two_numbers(firstListNode, secondListNode)

p "#{resultListNode.val} -> #{resultListNode.next.val} -> #{resultListNode.next.next.val} -> #{resultListNode.next.next.next.val}"

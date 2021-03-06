require 'benchmark'

# def findAWriter(line)
#   line = line.strip
#   arr = []
#   #return line[0...5]
#   if line.length > 0
#     Benchmark.bm do |x|
#       x.report do
#         5000.times do
#           arr = line.split('|')
#         end
#       end
#       x.report do
#         5000.times do
#           index = line.index('|')
#           arr[0] = line[0...index]
#           arr[1] = line[index..-1]
#         end
#       end
#     end
#   end
# end

def bitPositions(line)
    n, p1, p2 = line.strip.split(',')
    n = n.to_i.to_s(2)

    while n.length % 4 != 0
      n = "0" + n
    end

    return true if n[p1.to_i ] == n[p2.to_i ]
    return false
end

def multiplesOfANumber(line)
    x = line.split(',')[0].to_i
    n = line.split(',')[1].to_i
    ans = n
    while true
        if ans >= x
            puts ans 
            break
        end
        ans = ans + n
    end
end

def fibSeries(line)
  n = line.to_i
  if n == 0
    puts 0
  else
    arr = [0,1,1]
    (n-2).times do
      arr << arr[-1] + arr[-2]    
    end
    puts arr[-1]
  end
end

def oddNumbers
  (1..99).each do |i|
    puts i if i % 2 != 0
  end
end

def sumOfDigits(n)
    sum = 0 
    n.length.times do |i|
      sum += n[i].to_i
    end
    puts sum
end

def happyNumbers(line)
  str = line.to_s.strip
  arr = []
  sum = 0
  while sum != 1
    sum = 0 
    str.length.times do |i|
      sum += str[i].to_i**2
    end
    break if arr.include? sum
    arr << sum
    str = sum.to_s
  end

  if str.to_i == 1
    puts 1
  else
    puts 0
  end

end

def rightMostChar(line)
  str = line.split(',')[0]
  char = line.split(',')[1][0]
  i = str.length - 1
  while i >= 0
    if str[i] == char
      return i
    end
    i -= 1
  end
  return -1
end

def capitalizeWords(line)
  line =  line.split
  line.collect! do |word|
    word[0].upcase + word[1..-1]
  end
  line.join(' ')
end

def simpleSorting(line) #Bubble Sort
  arr = line
  #arr = line.split
  i = 0
  while i < arr.length - 1
    if arr[i].to_i > arr[i+1].to_i
      arr[i], arr[i+1] = arr[i+1], arr[i]
      i = 0
    else
      i += 1
    end
  end

  str = ""
  arr.each do |item|
    str += item + " "
  end
  return str.strip
end

def swapCase(line)
  str = line.strip
  ans = ""
  str.length.times do |i|
    if str[i].downcase == str[i]
      ans += str[i].upcase
    else
      ans += str[i].downcase
    end
  end
  return ans
end

def armstrongNumbers(line)
  line = line.strip
  sum = 0
  line.length.times do |i|
    sum += line[i].to_i**line.length
  end
  return "True" if sum == line.to_i
  return "False"
end

def morseCode(line)
  line = line.strip.split('  ')
  dic = {".-" => "A", 
    "-..." => "B", 
    "-.-." => "C",
    "-.." => "D",
    "." => "E",
    "..-." => "F",
    "--." => "G",
    "...." => "H",
    ".." => "I",
    ".---" => "J",
    "-.-" => "K",
    ".-.." => "L",
    "--" => "M",
    "-." => "N",
    "---" => "O",
    ".--." => "P",
    "--.-" => "Q",
    ".-." => "R",
    "..." => "S",
    "-" => "T",
    "..-" => "U",
    "...-" => "V",
    ".--" => "W",
    "-..-" => "X",
    "-.--" => "Y",
    "--.." => "Z",
    "-----" => "0",
    ".----" => "1",
    "..---" => "2",
    "...--" => "3",
    "....-" => "4",
    "....." => "5",
    "-...." => "6",
    "--..." => "7",
    "---.." => "8",
    "----." => "9"}

  ans = ""
  line.each do |word|
    word = word.split(' ')
    word.each do |letter|
      ans += dic[letter]
    end
    ans += " " if word.length > 0 #takes care of extra spaces > 2
  end
  return ans.strip
end

def lostInTranslation(line)
  line = line.strip
  dic = {"a" => "y",
    "b" =>"h",
    "c" =>"e",
    "d" =>"s",
    "e" =>"o",
    "f" =>"c",
    "g" =>"v",
    "h" =>"x",
    "i" =>"d",
    "j" =>"u",
    "k" =>"i",
    "l" =>"g",
    "m" =>"l",
    "n" =>"b",
    "o" =>"k",
    "p" =>"r",
    "q" =>"z",
    "r" =>"t",
    "s" =>"n",
    "t" =>"w",
    "u" =>"j",
    "v" =>"p",
    "w" =>"f",
    "x" =>"m",
    "y" =>"a",
    "z" =>"q",
    " " =>" "}

  ans = ""
  line.length.times do |i|
    ans += dic[line[i]]
  end
  return ans.strip
end

def evenNumbers(line)
  return 0 if line.to_i % 2 != 0
  return 1
end

def isInt?(str)
   !!(str =~ /^[-+]?[0-9]+$/)
end

def hiddenDigits(line)
  line = line.strip
  dic = {"a" => "0",
    "b" =>"1",
    "c" =>"2",
    "d" =>"3",
    "e" =>"4",
    "f" =>"5",
    "g" =>"6",
    "h" =>"7",
    "i" =>"8",
    "j" =>"9"}

  ans = ""
  line.length.times do |i|
    if dic[line[i]] #checks if a-j
      ans += dic[line[i]]
    elsif isInt?(line[i])
      ans += line[i] 
    end
  end
  return "NONE" if ans == ""
  return ans
end

def quicksort(array, from=0, to=nil)
    if to == nil
        # Sort the whole array, by default
        to = array.count - 1
    end
 
    if from >= to
        # Done sorting
        return
    end
 
    # Take a pivot value, at the far left
    pivot = array[from]
 
    # Min and Max pointers
    min = from
    max = to
 
    # Current free slot
    free = min
 
    while min < max
        if free == min # Evaluate array[max]
            if array[max] <= pivot # Smaller than pivot, must move
                array[free] = array[max]
                min += 1
                free = max
            else
                max -= 1
            end
        elsif free == max # Evaluate array[min]
            if array[min] >= pivot # Bigger than pivot, must move
                array[free] = array[min]
                max -= 1
                free = min
            else
                min += 1
            end
        else
            raise "Inconsistent state"
        end
    end
 
    array[free] = pivot
 
    quicksort array, from, free - 1
    quicksort array, free + 1, to
end

def roadTrip(line)
  line = line.strip
  numsarray = line.scan(/[0-9]{1,8}/) #match all instances of numbers between 1 and 8 digits long
  numsarray.collect! do |num|
    num.to_i
  end

  quicksort(numsarray) #not my quicksort, sorts inplace

  ans = []
  numsarray.each_with_index do |item,i|
    ans << item - numsarray[i-1]
  end
  ans[0] = numsarray[0]
  return ans.join(',')
end

def minimumCoins(line)
  num = line.strip.to_i
  coin5 = num / 5
  coin3 = (num % 5) / 3
  if  (5*coin5 + 3*coin3) < num
    coin1 = num - 5*coin5 - 3*coin3
  else
     coin1 = 0
  end
  return coin1 + coin3 + coin5

end

def penultimateWord(line)
  line = line.split
  return line[-2]
end

def wordToDigit(line)
  line = line.strip.split(';')
  dic = {"zero" => "0",
    "one" => "1",
    "two" => "2",
    "three" => "3",
    "four" => "4",
    "five" => "5",
    "six" => "6",
    "seven" => "7",
    "eight" => "8",
    "nine" => "9"}
  str = ""
  line.each do |numString|
    str << dic[numString]
  end
  str
end

def longestWord(line)
  line = line.strip.split

  largestWordAndLength = ["",0]
  line.each do |word|
    if word.length > largestWordAndLength[1]
      largestWordAndLength[0] = word
      largestWordAndLength[1] = word.length
    end
  end
  return largestWordAndLength[0]
end

def mixedContent(line)
  line = line.strip.split(',')
  intarr = []
  strarr = []

  line.each do |item|
    if isInt?(item)
      intarr << item
    else
      strarr << item
    end
  end

  if strarr.length > 0 && intarr.length > 0
    return strarr.join(',') + "|" + intarr.join(',')
  elsif strarr.length > 0
    return strarr.join(',')
  else
    return intarr.join(',')
  end
end

def findAWriter(line)
  line = line.strip
  code, nums = line.split('|') #code is the jumbled words, nums are the indexes of right words
  nums = nums.split

  nums.collect! do |codeIndex|
     code[codeIndex.to_i - 1] #the indxes are offsetted by 1 
  end
  return nums.join
end

def jsonMenuIds(line)
  require 'json'
  sum = 0
  items = JSON.parse(line)["menu"]["items"]
  items.each do |item|
    if item && item['label'] #isn't null and then if has label
      sum += item["id"]  
    end
  end
  return sum
end

def isletter?(str)
   !!(str =~ /[a-z]/)
end

def beautifulStrings(line)
  line = line.strip
  dic = {}
  line.length.times do |i|
    char = line[i].downcase
    if isletter?(char)
      if dic[char] #if character already in hash
        dic[char] += 1
      else
        dic[char] = 1
      end
    end
  end

  sum = 0
  beautifulVal = 26
  dic.values.sort.reverse.each do |value|
    sum += value*beautifulVal
    beautifulVal -= 1
  end

  return sum
end

#board = Array.new(256){Array.new(256,0)}
def queryBoard(line,board)
  line = line.strip.split
  index = line[1].to_i
  value = line[2].to_i

  if line[0] == "SetCol"
    board.length.times do |i|
      board[i][index] = value
    end
  elsif line[0] == "SetRow"
    board.length.times do |i|
      board[index][i] = value
    end
  elsif line[0] == "QueryCol"
    sum = 0
    board.length.times do |i|
      sum += board[i][index]
    end
    puts sum
  elsif line[0] == "QueryRow"
    sum = 0
    board.length.times do |i|
      sum += board[index][i]
    end
    puts sum
  end
end

def multiplyLists(line)
  arr1, arr2 = line.strip.split(' | ')
  arr1 = arr1.split
  arr2 = arr2.split
  
  arr1 = arr1.zip(arr2)
  arr1.collect! do |item1, item2|
    item1.to_i * item2.to_i
  end
  return arr1.join(' ')
end

# sum = 0
def sumOfIntegersFromFile(line,sum)
  sum += line.strip.to_i
end

def multiplicationTables
  table = Array.new(12){Array.new(12,0)}

  table.length.times do |i|
    table.length.times do |j|
      table[j][0] = j + 1
      table[0][j] = j + 1
      table[i][j] = table[i][0]*table[0][j]
    end
  end

  table.length.times do |i|
    table.length.times do |j|
      printf(" %3s", table[i][j].to_s)
    end
    puts ""
  end
end

def shortestRepetition(line)
  line = line.strip
  line.length.times do |len|
    solution = true
    splitted = line.chars.each_slice(len + 1).map(&:join) #splits into pieces
    temp = splitted[0]
    splitted.each do |item|
      if temp != item
        solution = false
        break
      end
    end
    return temp.length if solution == true
  end
end

def trailingString(line)
  left, right = line.strip.split(',')
  return 1 if left[-1*right.length..-1] == right
  return 0
end

def simpleCalculator(line)
  line = line.strip
  line = '(' + line + ')'

  def calculateOperation(str, operation)
    match = str.match(/[-]*\d+[\.]*\d*\s*#{Regexp.escape(operation)}\s*[-]*\d*[\.]*\d*/)
    left,right = match.to_s.split(operation)
    return nil if left == nil && right == nil
    case operation
    when "!"
      solution = ((1..5).inject(:*) || 1).to_s
    when "^"
      solution = (left.to_f ** right.to_f).to_s
    when "mod"
      solution = (left.to_f % right.to_f).to_s
    when "*"
      solution = (left.to_f * right.to_f).to_s    
    when "/"
      solution = (left.to_f / right.to_f).to_s   
    when "+"
      solution = (left.to_f + right.to_f).to_s
    when "- "
      solution = (left.to_f - right.to_f).to_s
    end
    str.gsub!(match.to_s,solution)
  end

  lackOfmulti = line.match(/[-]*\d+\(/).to_s #To insert * im something like 3(4 + 2) or -(4) before opening parenthesis
  if lackOfmulti.length > 0
    line.gsub!(lackOfmulti, lackOfmulti[0..-2] + "*" + "(")
  end

  emptynegative = line.match(/\-\(/).to_s #To insert -1* im something like -(4) before opening parenthesis
  if emptynegative.length > 0
    line.gsub!(emptynegative, "-1*(")
  end


  x = 0
  while true
    x = 0 if x >= 7

    # openParen = -1
    # closedParen = -1
    # (0...line.length).each do |i| #gets the inner most parenthesis
    #   if line[i] == '('
    #     openParen = i
    #   elsif line[i] == ')'
    #     closedParen = i
    #     break
    #   end
    # end

    closedParen = line.index(')')
    closedParen = -1 if !closedParen
    openParen = line[0..closedParen].rindex('(')
    openParen = -1 if !openParen

    innerParenStr = line[openParen..closedParen]


    if x == 0
      # ans = calculateOperation(innerParenStr,"!")
      ans = calculateOperation(innerParenStr,"^")
    elsif x == 1
      ans = calculateOperation(innerParenStr,"mod")
    elsif x == 2 || x == 3
      #the ORS for innerParenStr.length take care of when the index value is nil
      if (innerParenStr.index('*') || innerParenStr.length) < (innerParenStr.index('/') || innerParenStr.length)
        ans = calculateOperation(innerParenStr,"*")
      else
        ans = calculateOperation(innerParenStr,"/")
      end
    elsif x == 4 || x == 5
      if (innerParenStr.index('+') || innerParenStr.length) < (innerParenStr.index('- ') || innerParenStr.length)
        ans = calculateOperation(innerParenStr,"+")
      else
        ans = calculateOperation(innerParenStr,"- ")
      end
    end

    if ans #not nil
      line[openParen..closedParen] = ans
      x = 0 #reset if found valid
    end

    if x == 6
      if openParen == -1
        break
      else
        line[openParen..closedParen] = line[openParen + 1 .. closedParen - 1]
      end
    end

    x += 1
  end

  def prettify
    to_i == self ? to_i : self.round(5)
  end

  puts line.to_f.prettify
end

def validParentheses(line)
  line = line.strip
  return "False" if line.count('(') != line.count(')') || line.count('{') != line.count('}') || line.count('[') != line.count(']')
  
  def correctCloseTag?(endTag)
    if self == '('
      endTag == ')' ? true : false
    elsif self == '{'
      endTag == '}' ? true : false
    elsif self == '['
      endTag == ']' ? true : false
    else
      return false
    end
  end

  def isCloseTag?(tag)
    tag == ')' || tag == '}' || tag == ']' ? true : false
  end

  str = line[0]
  line.length.times do |paren|
    if paren > 0
      if isCloseTag?(line[paren]) && !str[-1].correctCloseTag?(line[paren])
        return "False" 
      end
      if isCloseTag?(line[paren]) && str[-1].correctCloseTag?(line[paren])
        str = str[0..-2] 
      else
        str << line[paren]
      end
    end
  end
  return "True"
end

class Node
  attr_accessor :value, :next
  def initialize(value)
    @value = value
    @next = nil
  end
end

class Stack
  attr_accessor :head, :tail

  def push(value)
    node = Node.new(value)
    if @head == nil
      @head = node
      @tail = node
    else
      @tail.next = node
      @tail = node
    end 
  end

  def pop()
    if @head == nil
      return nil
    elsif @head == @tail
      temp = @head
      @head = nil
      @tail = nil
      return temp.value
    else
      current = @head
      while current.next.next != nil
        current = current.next
      end
      temp = current.next
      current.next = nil
      @tail = current
      return temp.value
    end
  end

end

def stackImplementation(line)
  line = line.strip.split
  stack = Stack.new

  line.each do |num|
    stack.push(num)
  end

  i = 0
  output = []
  line.each do |num|
    returned = stack.pop
    output << returned if i % 2 == 0
    i += 1
  end
  return output.join(' ')
end

def emailValidation(line)
  line = line.strip
  match = line.match(/^[a-zA-Z\d\.]+[a-zA-Z\d\.\_\+]*\@[a-zA-Z\d]+\.*[a-zA-Z\.]+$/)
  return "true" if match
  return "false"
end

def numberOfOnes(line)
  line = line.strip
  bits = line.to_i.to_s(2)
  numOnes = 0

  bits.length.times do |i|
    numOnes += 1 if bits[i] == '1'
  end
  numOnes
end

def removeCharacters(line)
  str, removeTheseChars = line.strip.split(', ')
  removeTheseChars = removeTheseChars.split('')
  ans = ""
  str.length.times do |i|
    if !removeTheseChars.index(line[i])
      ans << line[i]
    end
  end
  ans
end

def cashRegister(line)
  cost, payment = line.strip.split(';')
  change = payment.to_f - cost.to_f
  return "ERROR" if change < 0
  return "ZERO" if change == 0

  dic = {'PENNY'=> 0.01,
        'NICKEL'=> 0.05,
        'DIME'=> 0.10,
        'QUARTER'=> 0.25,
        'HALF DOLLAR'=> 0.50,
        'ONE'=> 1.00,
        'TWO'=> 2.00,
        'FIVE'=> 5.00,
        'TEN'=> 10.00,
        'TWENTY'=> 20.00,
        'FIFTY'=> 50.00,
        'ONE HUNDRED'=> 100.00}

  ans = []
  while change > 0
    change = change.round(2) #Fixes float decimal problem

    dic.to_a.reverse.each do |key,value|
      if change >= value && change % value >= 0
        change -= value
        ans << key
        break #start from beginning because might need multiple of same value type
      end
    end
  end
  return ans.join(',')
end

def sudoku(line)
  boardType, nums = line.strip.split(';')
  boardType = boardType.to_i
  nums = nums.split(',')
  board = Array.new(boardType){Array.new(boardType,0)}

  i = 0
  boardType.times do |row|
    boardType.times do |col|
      board[row][col] = nums[i]
      i += 1
    end
  end

  boardType.times do |row|
    rowCheck = []
    colCheck = []
    boardType.times do |col|
      rowCheck << board[row][col]
      colCheck << board[col][row]
    end
    return "False" if rowCheck.uniq.length != rowCheck.length #checks for duplicates in a row
    return "False" if colCheck.uniq.length != colCheck.length #checks for duplicates in a row
  end
  return "True"
end

def balancedSmileys(line)
  line = line.strip

  def withoutSmileyBalanced?(line)
    if !(line.index('(:') ||   line.index('):') ||   line.index(':)') ||   line.index(':('))
      return "NO" if line.count('(') != line.count(')')
      openParen = 0
      closedParen = 0
      line.length.times do |i|
        openParen += 1 if line[i] == "("
        closedParen += 1 if line[i] == ")"
        return "NO" if closedParen > openParen
      end
    end
  end

  def breakSmileyBalanced?(line)
    arr = line.split('')
    openParen = 0
    closedParen = 0
    brokenParen = false
    arr.each_with_index do |char, i|
      openParen += 1 if char == "("
      closedParen += 1 if char == ")"
      if closedParen > openParen
        brokenParen = true 
        break
      end
    end
    return "YES" if openParen == closedParen && !brokenParen
  end

  x = 0
  originalLine = line
  smileyOrder = [':(',':)','):','(:'].permutation.map(&:join).to_a
  while x < smileyOrder.length

    i = 0
    smileyOrder[x] = smileyOrder[x].scan(/../)
    while i < 4
      line = line.sub(smileyOrder[x][i],'')
      return "YES" if breakSmileyBalanced?(line) == "YES"
      i += 1 if line.sub(smileyOrder[x][i],'') == line
    end
    line = originalLine
    x += 1
  end

  return 'NO'
end

def selfDescribingNumbers(line)
  line = line.strip.split('')
  line.each_with_index do |num, i|
    return 0 if num.to_i != line.count(i.to_s)
  end
  return 1
end

def setIntersection(line)
  set1, set2 = line.strip.split(';')
  set1 = set1.split(',')
  set2 = set2.split(',')
  ans = []
  if set1.length < set2.length
    set1.each do |item|
      ans << item if set2.index(item) 
    end
  else
    set2.each do |item|
      ans << item if set1.index(item) 
    end
  end
  return ans.join(',')
end

def swapElements(line)
  puts line
  line, swaps = line.strip.split(' : ')
  line = line.split
  swaps = swaps.split(', ')
  swaps.each do |swap|
    swap = swap.split('-')
    line[swap[0].to_i], line[swap[1].to_i] = line[swap[1].to_i].to_s, line[swap[0].to_i].to_s
    puts line.join(' ')
  end
  return line.join(' ')
end

def calculateDistance(line)
  line = line.strip
  nums = line.scan(/[-]*\d+/)
  Math.sqrt((nums[0].to_i- nums[2].to_i)**2 + (nums[1].to_i - nums[3].to_i)**2).to_i
end

def nModm(line)
  line = line.strip.split(',')
  n = line[0].to_i
  m = line[1].to_i
  n - (n / m)*m
end

def lowestUniqueNumber(line)
  line = line.strip.split
  numCount = Array.new(10,0)
  line.each do |num|
    numCount[num.to_i] += 1
  end
  numCount.each_with_index do |num,i|
    return line.index(i.to_s) + 1 if num == 1
  end
  return 0
end

def romanNumerals(line)
  num = line.strip.to_i
  ans = ""
  dic = {1 => "I", 4 => "IV", 5 => "V", 9 => "IX", 10 => "X", 40 => "XL", 50 => "L", 90 => "XC", 100 => "C", 400 => "CD", 500 => "D", 900 => "CM", 1000 => "M"}

  while num != 0
    dic.to_a.reverse.each do |key,value|
      if num >= key && num % key >= 0
        ans << value
        num -= key
        break
      end
    end
  end
  ans
end

def uniqueElements(line) #they are sorted so no need to make hash
  line = line.strip.split(',')
  ans = []
  prev = nil
  line.each do |num|
    ans << num if num != prev
    prev = num
  end
  ans.join(',')
end

def hexToDecimal(line)
  line = line.strip.split('')
  deci = 0
  dic = {"a" => 10, "b" => 11, "c" => 12, "d" => 13, "e" => 14, "f" => 15}
  line.reverse.each_with_index do |hexChar, i|
    if dic[hexChar]
      deci += dic[hexChar] * (16**i)
    else
      deci += hexChar.to_i * (16**i)
    end
  end
  deci
end

def fileSize(line)
  File.size(ARGV[0])
end

def chainInspection(line)
  chains = line.strip.split(';')

  completed = []
  currentNum = "BEGIN"
  while currentNum != "END"
    currentChain = chains.grep(/^#{currentNum}-/) #Checks from start or might use longer num with same consecutive digits as currentNum
    return "BAD" if completed.index(currentChain)
    currentNum = currentChain[0].scan(/-(.+)/)[0][0]
    completed << currentChain
  end
  return "BAD" if completed.length < chains.length
  return "GOOD"
end

def findASquare(line)

  def calculateDistance(point1,point2)
    Math.sqrt((point1[0] - point2[0])**2 + (point1[1] - point2[1])**2).round
  end

  points = line.strip.scan(/\d+/)
  points = points.each_slice(2).map { |n1, n2| [n1.to_i,n2.to_i] }

  i = 0
  sumDistances = []
  points.each do |point1|
    sumDistances[i] = []
    points.each do |point2|
      sumDistances[i] << calculateDistance(point1,point2)
    end
    sumDistances[i].sort!
    i += 1
  end

  return "false" if sumDistances[0] != sumDistances[1] || sumDistances[0] != sumDistances[2] || sumDistances[0] != sumDistances[3] 
  return "false" if sumDistances[0].count(0) > 1
  return "true"
end

def panagrams(line)
  line = line.strip.downcase
  missingChars = ""
  (97..122).each do |charDeci| #converts the a-z decimal to char and searches the input
    char = charDeci.chr
    missingChars << char if !line.index(char)
  end
  return missingChars if missingChars.length > 0
  return "NULL"
end

def decimalToBinary(line)
  line = line.strip.to_i
  ans = ""
  return "0" if line == 0
  100.downto(0).each do |i|
    if 2**i <= line
      ans << "1"
      line -= 2**i
    elsif ans.length > 0
      ans << "0"
    end
  end
  ans
end

def numberPairs(line)
  nums, desiredSum = line.strip.split(';')
  desiredSum = desiredSum.to_i
  nums = nums.split(',')
  ans = []
  nums.each do |num1|
    nums.each do |num2|
      num1 = num1.to_i
      num2 = num2.to_i
      ans << "#{num1},#{num2}" if num1 + num2 == desiredSum && num1 < num2
    end
  end
  return "NULL" if ans == []
  return ans.join(';')
end

def pointInCircle(line)
  line = line.strip
  nums = line.scan(/[-]*\d+\.*\d*/)
  center = nums[0..1]
  radius = nums[2]
  point = nums[3..4]

  distance = Math.sqrt((center[0].to_f - point[0].to_f)**2 + (center[1].to_f - point[1].to_f)**2).round(2)
  return "true" if distance <= radius.to_f
  return "false"
end

def decodeNumbers(line)
  line = line.strip.split('')

  count = 0
  size = line.length / 2
  combinations = []
  (0..size).each do |i|
    str = ""
    (line.length - i*2).times { str << "0"}
    (i).times { str << "1"}
    combinations << str.split('').to_a.permutation.map(&:join).uniq
  end
  
  combinations.each do |combination|
    combination.each do |zeroesAndOnes|
      i = 0
      isValid = true
      temp = line.dup
      zeroesAndOnes.split('').each do |num|
        if num == "1"
          temp[i] = temp[i] + temp[i+1]
          isValid = false if temp[i].to_i > 26
          i += 2
        else
          i += 1
        end
      end
      count += 1 if isValid
    end
  end
  count
end

def reverseWords(line)
  line = line.strip.split
  ans = []
  line.reverse.each do |word|
    ans << word
  end
  ans.join(' ')
end

def sumOfPrimes
  num = 3
  sum = 2
  numPrimes = 1
  while numPrimes != 1000
    isPrime = true
    (2...num).each do |i|
      if num % i == 0
        isPrime = false
        break
      end
    end
    if isPrime
      sum += num
      numPrimes += 1
    end
    num += 1
  end
  sum
end

def detectingCycles(line)
  line = line.strip.split

  cycleSize = 1
  while cycleSize < line.length
    temp = []
    line.each_with_index do |num1, i|
      temp = line[i-cycleSize..i-1]
      return temp.join(' ') if line[i..i+cycleSize-1] == temp
    end
    cycleSize += 1
  end

  return "false"
end

def overlappingRectangles(line)
  line = line.strip.split(',')
  r1 = line[0..3]
  r2 = line[4..-1]
  r1Range = [[r1[0].to_i,r1[2].to_i],[r1[3].to_i,r1[1].to_i]]
  r2Range = [[r2[0].to_i,r2[2].to_i],[r2[3].to_i,r2[1].to_i]]

  coords = []
  (r1Range[0][0]..r1Range[0][1]).each do |x|
    (r1Range[1][0]..r1Range[1][1]).each do |y|
      coords << [x,y]  
    end
  end
  tleft = [r2Range[0][0],r2Range[1][1]]
  tright = [r2Range[0][1],r2Range[1][1]]
  bleft = [r2Range[0][0],r2Range[1][0]]
  bright = [r2Range[0][1],r2Range[1][0]]
  return "True" if coords.index(tleft) || coords.index(tright) || coords.index(bleft) || coords.index(bright)

  coords = []
  (r2Range[0][0]..r2Range[0][1]).each do |x|
    (r2Range[1][0]..r2Range[1][1]).each do |y|
      coords << [x,y]  
    end
  end
  tleft = [r1Range[0][0],r1Range[1][1]]
  tright = [r1Range[0][1],r1Range[1][1]]
  bleft = [r1Range[0][0],r1Range[1][0]]
  bright = [r1Range[0][1],r1Range[1][0]]
  return "True" if coords.index(tleft) || coords.index(tright) || coords.index(bleft) || coords.index(bright)
  return "False"
end

def compressedSequence(line)
  line = line.strip.split
  count = 0
  ans = ""
  last = line[0]
  line.each do |num|
    if last == num
      count += 1
    else
      ans << "#{count} #{last} "
      count = 1
      last = num
    end
  end
  ans << "#{count} #{last}"
  ans
end

def stringRotation(line)
  str1, str2 = line.strip.split(',')
  return "False" if str1.length != str2.length
  return "True" if str1 == str2
  str1 = str1.split('')
  str2 = str2.split('')
  str2.length.times do |i|
    temp = str2.pop
    str2.unshift(temp)
    return "True" if  str1 == str2
  end
  return "False"
end

def textDollar(line)
  single = {1 => 'One', 2 => 'Two', 3 => 'Three', 4 => 'Four', 5 => "Five", 6 => "Six", 7 => "Seven", 8 => "Eight", 9 => "Nine"}
  tens = {10 => "Ten", 11 => 'Eleven', 12 => 'Twelve', 13 => 'Thirteen', 14 => 'Fourteen', 15 => "Fifteen", 16 => "Sixteen", 17 => "Seventeen", 18 => "Eighteen", 19 => "Nineteen"}
  doubles = {1 => 'Ten', 2 => "Twenty", 3 => 'Thirty', 4 => 'Forty', 5 => 'Fifty', 6 => 'Sixty', 7 => "Seventy", 8 => "Eighty", 9 => "Ninety"}

  num = line.strip.to_i
  ans = ""
  thousand = true
  million = true

  if num >= 100000000
    ans += "#{single[num.to_s[0].to_i]}Hundred"
    if num.to_s[1] == "0" && num.to_s[2] == "0"
      ans += "Million"
      million = false
    end
    num -= (num.to_s[0] + "00000000").to_i
  end

  if num >= 20000000 && num < 100000000
    ans += "#{doubles[num.to_s[0].to_i]}"
    ans += single[num.to_s[1].to_i] if single[num.to_s[1].to_i]
    ans += "Million" if million == true
    num -= (num.to_s[0..1] + "000000").to_i
  elsif num >= 10000000
    ans += "#{tens[num.to_s[0..1].to_i]}"
    ans += "Million" if million == true
    num -= (num.to_s[0..1] + "000000").to_i
  elsif num >= 1000000 && num < 10000000
    ans += "#{single[num.to_s[0].to_i]}"
    ans += "Million" if million == true
    num -= (num.to_s[0] + "000000").to_i
  end

  if num >= 100000 && num < 1000000
    ans += "#{single[num.to_s[0].to_i]}Hundred"
    if num.to_s[1] == "0" && num.to_s[2] == "0"
      ans += "Thousand"
      thousand = false
    end
    num -= (num.to_s[0] + "00000").to_i
  end

  if num >= 20000 && num < 100000
    ans += "#{doubles[num.to_s[0].to_i]}"
    ans += single[num.to_s[1].to_i] if single[num.to_s[1].to_i]
    ans += "Thousand"
    num -= (num.to_s[0..1] + "000").to_i
  elsif num >= 10000
    ans += "#{tens[num.to_s[0..1].to_i]}"
    ans += "Thousand" if thousand
    num -= (num.to_s[0..1] + "000").to_i
  elsif num >= 1000 && num < 10000 
    ans += "#{single[num.to_s[0].to_i]}"
    ans += "Thousand" if thousand
    num -= (num.to_s[0] + "000").to_i
  end

  if num >= 100 && num < 1000 
    ans += "#{single[num.to_s[0].to_i]}Hundred"
    num -= (num.to_s[0] + "00").to_i
  end
  if num >= 20 && num < 100
    ans += doubles[num.to_s[0].to_i]
    num -= (num.to_s[0] + "0").to_i
  end
  if num >= 10 && num <= 19
    ans += tens[num] if tens[num]
    num = 0
  end
  if num < 10
    ans += single[num] if single[num]
    num = 0
  end

  ans += "Dollars"
end

def messageDecoding(line)
  line = line.strip
  input = []
  bits = []
  line.length.times do |i|
    if line[i] == "0" || line[i] == "1"
      bits << line[i]
    else
      input << line[i]
    end
  end

  x = 0
  keys = ["0"]
  while x < input.length
    nextBit = (keys[-1].to_i(2) + 1).to_s(2)
    if nextBit.length < keys[-1].length
      nextBit = "0" * (keys[-1].length - nextBit.length) + nextBit
    end

    if nextBit.count("1") == nextBit.length
      keys << "0" * (nextBit.length + 1)
    else
      keys << nextBit
    end
    x += 1
  end

  ans = ""
  startPos = 0
  while true
    size = bits[startPos..startPos+2].join('').to_i(2)
    segEnd = "1"*size
    startPos += 3

    bits[startPos..-1].each_slice(size) do |*items|
      startPos += size
      if items.join('') == segEnd
        break
      else
        ans += input[keys.index(items.join(''))]
      end
    end

    break if bits[startPos..startPos+2].join('').to_i(2) == 0
  end
  ans
end

def countingPrimes(line)
  n1,n2 = line.strip.split(',')

  count = 0
  (n1.to_i..n2.to_i).each do |num|
    isPrime = true
    (2...num).each do |i|
      if num % i == 0
        isPrime = false
        break
      end
    end
    count += 1 if isPrime
  end
  count
end

def reverseGroups(line)
  nums,k = line.strip.split(';')
  nums = nums.split(',')
  ans = []
  nums.each_slice(k.to_i) do |*x|
    if x[0].length == k.to_i
      ans << x[0].reverse
    else
      ans << x[0]
    end
  end
  ans.join(',')
end

def firstNonRepeatedCharacter(line)
  str = line.strip
  str.length.times do |i|
    return str[i] if str.count(str[i]) == 1
  end
end

def arrayAbsurdity(line)
  size, nums = line.strip.split(';')
  nums = nums.split(',')
  sum1 = 0
  sum2 = 0
  (1..size.to_i-2).each { |i| sum1 += i }
  nums.each { |i| sum2 += i.to_i }
  return sum2 - sum1
end

def longestLines
  numLines = File.open(ARGV[0], &:readline).to_i
  lines = []
  linesLen = []
  File.open(ARGV[0]).each_line do |line|
    line = line.strip
    lines << line
    linesLen << line.length
  end
  sortedLen = linesLen.sort.reverse
  (0...numLines).each do |i|
    puts lines[linesLen.index(sortedLen[i])]
  end
end

class TreeNode
  attr_accessor :value, :left, :right

  def initialize(value)
    @value = value
    @left = nil
    @right  = nil
  end
end


class BinaryTree
  attr_accessor :root

  def initialize

  end

  def add(value)
    node = TreeNode.new(value)
    if @root == nil
      @root = node
      return true
    end

    current = @root
    while true
      if value >= current.value 
        if current.right == nil
          current.right = node
          break
        end
        current = current.right
      else
        if current.left == nil
          current.left = node
          break
        end
        current = current.left
      end
    end
    current = node
  end

  def findPath(value)
    return false if @root == nil
    path = []
    current = @root
    while true
      if value > current.value 
        if current.right == nil
          return false
        end
        path << current.value
        current = current.right
      elsif value < current.value
        if current.left == nil
          return false
        end
        path << current.value
        current = current.left
      else
        path << current.value
        return path
      end
    end
  end
end

def lowestCommonAncestor(line)
  n1, n2 = line.strip.split
  tree = BinaryTree.new
  tree.add(30)
  tree.add(8)
  tree.add(52)
  tree.add(3)
  tree.add(20)
  tree.add(10)
  tree.add(29)

  path1 = tree.findPath(n1.to_i)
  path2 = tree.findPath(n2.to_i)
  path1.reverse.each do |num|
    return num if path2.index(num)
  end
end

def typeAhead(line)
  n, word = line.strip.split(',')
  n = n.to_i - 1
  str = 'Mary had a little lamb its fleece was white as snow;
  And everywhere that Mary went, the lamb was sure to go.
  It followed her to school one day, which was against the rule;
  It made the children laugh and play, to see a lamb at school.
  And so the teacher turned it out, but still it lingered near,
  And waited patiently about till Mary did appear.
  "Why does the lamb love Mary so?" the eager children cry; "Why, Mary loves the lamb, you know" the teacher did reply."'

  str = str.split
  wordsAfter = {}
  numWords = 0
  indexes =  str.each_index.select{|i| str[i...i+n].join(' ').gsub(/[^a-zA-Z\s]/, '') == word}
  indexes.each do |i|
    if wordsAfter[str[i+n].gsub(/[^a-zA-Z\s]/, '')]
      wordsAfter[str[i+n].gsub(/[^a-zA-Z\s]/, '')] += 1
    else
      wordsAfter[str[i+n].gsub(/[^a-zA-Z\s]/, '')] = 1
    end
    numWords += 1
  end
  wordsAfter = wordsAfter.sort_by {|key, value| [-Integer(value),key]}
  ans = []
  wordsAfter.each do |string,count|
    percent = "%0.3f" % (count/numWords.to_f).round(3) #rounds and displays 3 decimals
    ans << "#{string},#{percent}"
  end
  ans.join(';')
end

def splitTheNumber(line)
    num, chars = line.strip.split
    if chars.index('-')
        splitPoint = chars.index('-')
        return num[0...splitPoint].to_i - num[splitPoint..-1].to_i
    elsif chars.index('+')
        splitPoint = chars.index('+')
        return num[0...splitPoint].to_i + num[splitPoint..-1].to_i
    end
end

def reverseAndAdd(line)
  line = line.strip
  count = 0
  while line != line.reverse
    line = (line.to_i + line.reverse.to_i).to_s
    count += 1
  end
  return count.to_s + " " + line
end


def theMajorElement(line)
  nums = line.strip.split(',')
  hash = {}
  i = 0
  nums.each do |num|
    if hash[num]
      hash[num] += 1
    else
      hash[num] = 1
    end
    i += 1
  end
  halfLen = nums.length / 2
  hash.each do |key, value|
    return key if value > halfLen
  end
  "None"
end

def racingChars
  path = []
  File.open(ARGV[0]).each_line do |line|
    line = line.strip
    if(line.index("C"))
      path << [line.index("C"),line.index("_")]
    else
      path << [line.index("_"),line.index("_")]
    end
  end

  relative = 0
  str = "#"*12
  str[path[0][0]] = "|"
  puts str

  (1...path.length).each do |i|
    p = path[i][0]
    relative = p - path[i-1][0]
    if(relative == 0)
      char =  "|"
    elsif(relative == -1)
      char =  "/"
    else
      char =  "\\"
    end

    str = "#"*12
    str[path[i][1]] = "_"
    str[p] = char
    puts str
  end
end

def workingExperience
  months = ['Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct','Nov','Dec']

  File.open(ARGV[0]).each_line do |line|
    line = line.strip.split('; ')
    dic = {}
    line.each do |employed|
      month =  employed[0..2]
      year = employed[4..7].to_i
      endMonth = employed[9..11]
      endYear = employed[13..16].to_i

      while(year != endYear || month != endMonth)
        if(!dic.include?(year)) 
          dic[year] = []
        end

        if(!dic[year].include?(month))
          dic[year] << month
        end

        index = months.index(month)
        if(index == 11)
          index = 0
          year = year + 1
        else
          index = index + 1
        end
        month = months[index]
      end

      if(!dic.include?(year)) 
        dic[year] = [month]
      end

      if(!dic[year].include?(month))
        dic[year] << month
      end

    end
    
    numMonths = 0
    dic.each do |key,value|
      numMonths += value.length
    end

    puts numMonths / 12
  end

end

def dataRecovery(line)
  words, nums = line.strip.split(';')
  words = words.split
  nums = nums.split
  sentence = []
  nums.each_with_index do |num,i|
    num = num.to_i
    sentence[num-1] = words[i]
  end

  missingIndex = sentence.index(nil)
  if missingIndex
    sentence[missingIndex] = words[-1]
  else
    sentence << words[-1]
  end

  puts sentence.join(' ') 
end

def ministryOfTruth(line)
  sentence, approved = line.split(';')
  sentence = sentence.split
  approved = approved.split

  approved.each do |approvedWord|
    sentence.each do |word|
      if word.index(approvedWord)

        if word.index(approvedWord) > 0
          word[0...word.index(approvedWord)] = '_'*word.index(approvedWord)
        end

        word[word.index(approvedWord)+approvedWord.length..-1] = '_'*(word.length - (word.index(approvedWord)+approvedWord.length))

      end
    end
  end

  sentence.each_with_index do |word,i|
    if !word.index('_') && !approved.index(word)
      sentence[i] = '_'*sentence[i].length  
    end
  end

  sentence = sentence.join(' ')
  ans = sentence.gsub(/[_]+/,'')

  ans = ans.strip
  ans.gsub!(/\s{2,}/,' ') #Replace multiple whitespace with single

  # puts ans
  # puts approved.join(' ')
  if ans == approved.join(' ')
    puts sentence
  else
    puts "I cannot fix history"
  end
  # puts '--------------------'
end

def ageDistribution(num)
  num = num.strip.to_i
  if num < 0 || num > 100
    puts "This program is for humans"
  elsif num <= 2
    puts "Still in Mama's arms"
  elsif num <= 4
    puts "Preschool Maniac"
  elsif num <= 11
    puts "Elementary school"
  elsif num <= 14
    puts "Middle school"
  elsif num <= 18
    puts "High school"
  elsif num <= 22
    puts "College"
  elsif num <= 65
    puts "Working for the man"
  elsif num <= 100
    puts "The Golden Years"
  end
end

def lettercasePercentRatio(line)
  line = line.strip
  numLowerCase = 0.0
  numUpperCase = 0.0
  line.length.times do |i|
    line[i] == line[i].downcase ? numLowerCase += 1 : numUpperCase += 1
  end
  percentLower = (numLowerCase / line.length * 100)
  percentUpper = (numUpperCase / line.length * 100)
  puts "lowercase: " + sprintf('%.2f', percentLower) + " uppercase: " + sprintf('%.2f', percentUpper)
end

def jugglingWithZeros(line)
  line = line.strip.split(' ')
  binary = ""
  flag = ""
  line.each_with_index do |item, i|
    if i % 2 == 0
      item == "0" ? flag = "0" : flag = "1"
    else
      binary += flag * item.length
    end
  end
  puts binary.to_i(2) #converts to int
end

def batsChallenge(line)
  line = line.strip.split
  wireLength = line[0].to_i
  distance = line[1].to_i
  bats = line[3..-1]
  numNewBats = 0
  if bats.length > 1
    bats.length.times do |i|
      if i == 0
        numNewBats += (bats[0].to_i - 6) / distance
      elsif i == bats.length - 1
        numNewBats += (wireLength - 6 - bats[i].to_i) / distance
      else
        numNewBats += (bats[i+1].to_i - bats[i].to_i) / distance - 1
      end
    end
  elsif bats.length == 1
    numNewBats += (bats[0].to_i - 6) / distance
    numNewBats += (wireLength - 6 - bats[0].to_i) / distance
  else
    numNewBats = (wireLength - 12) / distance + 1
  end
  puts numNewBats
end

def locks(line)
  line = line.strip.split(' ')
  passNum = 1
  n = line[0].to_i
  m = line[1].to_i
  locks = Array.new(n,0)
  while passNum <= m
    if passNum % 2 != 0
      if passNum == m
        locks.length % 2 == 0 ? i = locks.length - 1 : i = locks.length - 2
        locks[i] == 1 ? locks[i] = 0 : locks[i] = 1
      else
        i = 1
        while i < locks.length
          locks[i] = 1
          i += 2
        end
      end
    else
      if passNum == m
        i = locks.length - 1 if locks.length % 3 == 0
        i = locks.length - 2 if locks.length % 3 == 1
        i = locks.length - 3 if locks.length % 3 == 2
        locks[i] == 1 ? locks[i] = 0 : locks[i] = 1
      else
        i = 2
        while i < locks.length
          locks[i] == 1 ? locks[i] = 0 : locks[i] = 1
          i += 3
        end    
      end
    end
    # print locks
    puts ""
    passNum += 1
  end
  puts locks.count(0)
end

def rollercoaster(line)
  line = line.strip
  upper = false
  line.length.times do |i|
    if !upper
      line[i] = line[i].upcase
      upper = true if line[i].downcase != line[i].upcase
    else
      line[i] = line[i].downcase
      upper = false if line[i].downcase != line[i].upcase
    end
  end
  puts line
end

def wordChain(line)
  words = line.strip.split(',')
  i = 0
  while i < words.length
    startChar = words[i][0]
    endChar = words[i][-1]
    x = 0
    found = false
    while x < words.length
      if words[x][-1] == startChar || words[x][0] == endChar
        found = true
      end
      x += 1
    end
    if !found
      words.delete_at(i)
    else
      i += 1
    end
  end
  print words
end

def readMore(line)
  if line.length <= 55
    puts line
  else
    lastSpace = line[0...40].rindex(' ')
    if lastSpace
      puts line[0...lastSpace + 1].strip + '... <Read More>'
    else
      puts line[0...40] 
    end
  end
end

File.open(ARGV[0]).each_line do |line|
  readMore(line)
end
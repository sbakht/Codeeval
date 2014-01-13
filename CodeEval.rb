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
    n1 = line.split(',')[0].to_i.to_s(2)
    n2 = line.split(',')[1].to_i.to_s(2)
    position = line.split(',')[2].to_i

    if n1.length > n2.length
        (n1.length-n2.length).times do
            n2 = "0" + n2
        end
    elsif n2.length > n1.length
        (n2.length-n1.length).times do
            n1 = "0" + n1
        end
    end

    if n1[position] == n2[position]
        puts "true"
    else
        puts "false"
    end  
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

  def exponentString(str)
    match = str.match(/[-]*\d+[\.]*\d*\s*\^\s*[-]*\d+[\.]*\d*/)
    left,right = match.to_s.split("^")
    return nil if left == nil && right == nil
    solution = (left.to_f ** right.to_f).to_s
    str.gsub!(match.to_s,solution)
  end

  def multiplyString(str)
    match = str.match(/[-]*\d+[\.]*\d*\s*\*\s*[-]*\d+[\.]*\d*/)
    left,right = match.to_s.split("*")
    return nil if left == nil && right == nil
    solution = (left.to_f * right.to_f).to_s
    str.gsub!(match.to_s,solution)
  end

  def divideString(str)
    match = str.match(/[-]*\d+[\.]*\d*\s*\/\s*[-]*\d+[\.]*\d*/)
    left,right = match.to_s.split("/")
    return nil if left == nil && right == nil
    solution = (left.to_f / right.to_f).to_s
    str.gsub!(match.to_s,solution)
  end

  def addString(str)
    match = str.match(/[-]*\d+[\.]*\d*\s*\+\s*[-]*\d+[\.]*\d*/)
    left,right = match.to_s.split("+")
    return nil if left == nil && right == nil
    solution = (left.to_f + right.to_f).to_s
    str.gsub!(match.to_s,solution)
  end

  def subtractString(str)
    match = str.match(/[-]*\d+[\.]*\d*\s*\-\s*[-]*\d+[\.]*\d*/)
    left,right = match.to_s.split("- ")
    return nil if left == nil && right == nil
    solution = (left.to_f - right.to_f).to_s
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
    x = 0 if x >= 6

    openParen = -1
    closedParen = -1
    (0...line.length).each do |i| #gets the inner most parenthesis
      if line[i] == '('
        openParen = i
      elsif line[i] == ')'
        closedParen = i
        break
      end
    end

    innerParenStr = line[openParen..closedParen]


    if x == 0
      ans = exponentString(innerParenStr)
      x = 0 if ans
    elsif x == 1 || x == 2
      #the ORS for innerParenStr.length take care of when the index value is nil
      if (innerParenStr.index('*') || innerParenStr.length) < (innerParenStr.index('/') || innerParenStr.length)
        ans = multiplyString(innerParenStr)
      else
        ans = divideString(innerParenStr)
      end
      x = 0 if ans
    elsif x == 3 || x == 4
      if (innerParenStr.index('+') || innerParenStr.length) < (innerParenStr.index('- ') || innerParenStr.length)
        ans = addString(innerParenStr)
      else
        ans = subtractString(innerParenStr)
      end
      x = 0 if ans
    end

    if ans #not nil
      line[openParen..closedParen] = ans
      x = 0 #reset if found valid
    end

    if x == 5
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

  return line.to_f.prettify
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
  
end

File.open(ARGV[0]).each_line do |line|
  puts sudoku(line)
end
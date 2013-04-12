# homework1.rb
# Jon Dosch
#
# Retrieves all the domains from the homework_one_text.txt file
# and displays them in a right-aligned table along with the number
# of times the domain appears in the text file.

# the domain is of the form: name@host.domain
# some of the domains in the file are attached to other letters,
# so the actual domain has to be extracted
domain_regex = /([\w\-\/]+@[\w\-\/]+\.[\w\-\/]+)/


# get all the domains
domains = IO.read("homework_one_text.txt").split(/\s/).select {
  |word|
  word.match domain_regex
}.map {
    |domain|
  domain.match(domain_regex)[0].split(/@/)[1]
}.sort

# get the max domain length for right justifying
max_length = domains.map {
  |domain|
  domain.length
}.sort_by {
  |length|
  -length
}[0]

# get the frequency of each domain
domain_frequency = Hash.new(0)
domains.each {
  |domain|
  domain_frequency[domain.downcase] += 1
}

# print out results; use max_length + some padding for the domain column
puts "\nDomain Results"
(max_length+15).times {print '='}
puts "\n"

domains.each {
  |domain|
  puts (domain + ':').rjust(max_length + 3) + (domain_frequency[domain].to_s + ' time(s)').rjust(12)
}



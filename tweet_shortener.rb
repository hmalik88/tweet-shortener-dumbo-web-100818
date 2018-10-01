require 'pry'

def dictionary
	dictionary = {
		"hello" => "hi", 
		"to, two, too" => "2", 
		"for, four" => "4", 
		"be" => "b", 
		"you" => "u",
		"at" => "@",
		"and" => "&"
	}
end

def word_substituter(tweet)
	tweet_array = tweet.split(" ")
	key_array = dictionary.keys
	#binding.pry
	tweet_array.each_with_index do |word, index|
		key_array.each do |keyword|
			if keyword.include?(word) && word.size != 1 || keyword.capitalize.include?(word) && word.size != 1
				tweet_array[index] = dictionary[keyword]
			end
		end
	end
	tweet_array = tweet_array.join(" ")
end

def bulk_tweet_shortener(tweets)
	tweets.each do |sentences|
		puts word_substituter(sentences)
	end
end

def selective_tweet_shortener(tweet)
	if tweet.size > 140
		return word_substituter(tweet)
	else
		return tweet
	end
end

def shortened_tweet_truncator(tweet)
	new_tweet = word_substituter(tweet)
	if new_tweet.size > 140
		new_tweet = new_tweet[0..139]
		return new_tweet
	else
		return tweet
	end
end


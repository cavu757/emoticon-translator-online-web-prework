require "pry"
require "yaml"

def load_library(file_path)
  emoticon_hash = {}
  temp_hash = YAML.load_file(file_path)
  temp_hash.each do |meaning, value|
    emoticon_hash["get_meaning"] ||= {}
    emoticon_hash["get_meaning"][value[1]] ||= meaning
    emoticon_hash["get_emoticon"] ||= {}
    emoticon_hash["get_emoticon"][value[0]] ||= value[1]
  end
  emoticon_hash
end

def get_japanese_emoticon(file_path,emoticon)
  hash = load_library(file_path)
  if hash["get_emoticon"].include? (emoticon)
    hash["get_emoticon"][emoticon]
  else
    "Sorry, that emoticon was not found"
  end
end

def get_english_meaning(file_path,emoticon)
  hash = load_library(file_path)
  if hash["get_meaning"].include? (emoticon)
    hash["get_meaning"][emoticon]
  else
    "Sorry, that emoticon was not found"
  end
end

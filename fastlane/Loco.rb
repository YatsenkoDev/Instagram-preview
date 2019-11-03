class Loco

  #
  # @param apikey string
  # @param fallback_locale string
  #
  def initialize(api_key, fallback_locale = "en")
    @api_key = api_key
    @fallback_locale = fallback_locale
  end

  #
  # @param language string
  #
  def sync_main_language(language, save_to = "#{__dir__}")
    puts "Downloading '#{language}' as primary translations..."
    sync_language(language, save_to, true)
  end

  #
  # @param language string
  #
  def sync_language(language, save_to, isMain = false)
    puts "sync_language '#{language}' save_to = '#{save_to}"
    destination = ""
    destination = language.dup
    destination.sub! '-', '-r'
    destination = "-" + destination
    
    puts "Downloading '#{language}' translations fallback_locale = #{@fallback_locale}..."

    translations = `curl 'https://localise.biz/api/export/locale/#{language}.json?fallback=#{@fallback_locale}' -u #{@api_key}:  --silent`

    directory = "#{save_to}"
    puts "Destination #{destination}"

    unless File.directory?(directory)
      puts 'Creating directory for translations'
      Dir.mkdir(directory)
    end

    puts "Saving '#{language}' translations."
    file = "#{directory}/locale_#{language}.json"

    if File.exist?(file)
      File.delete(file)
    end
    file = File.open(file, 'w')
    file.write(translations)
    file.close

    puts ''

  end

  #
  # print untranslated keys to console and download all languages
  # @param languages string[]
  #
  def sync_languages(languages, save_to = "#{__dir__}")
    validate
    languages.each { |language|
      self.sync_language(language, save_to)
    }
  end

  #
  # print untranslated keys in console.
  #
  def validate
    untranslated = self.get_untranslated_keys
    untranslated.each { |key|
      puts "WARNING: \"#{key['id']}\" is not translated in #{key['untranslated']} languages"
    }
  end

  #
  # fetch untranslated keys from loco
  #
  def get_untranslated_keys
    ret = []
    begin
      raw_response = `curl -s 'https://localise.biz/api/assets' -u #{@api_key}: --silent`      
      response = JSON.parse(raw_response)
      response.each { |key|
        if key['progress']['untranslated'] > 0
          ret.push(key)
        end
      }
      return ret
    rescue => error
      puts 'Error: Cannot connect or parse response from loco api while trying to validate translations'
      puts "Error message: #{error.message}"
      exit
    end
  end
end
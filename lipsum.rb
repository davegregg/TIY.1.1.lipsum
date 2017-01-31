#!/usr/bin/env ruby

lipsum_out = String.new
lipsum_wanted = ARGV[0] ? ARGV[0].downcase : ''
lipsum_paragraphs = ( (ARGV[1].to_i < 1 ) ? 1 : ARGV[1].to_i )
lipsum_options = 'As always, your options are: "Jackson", "Doctor", or "Dentist". Please enter one.' + "\n\n"
lipsum = Hash.new
lipsum['jackson'] = 'You picked "Jackson": "Now that there is the Tec-9, a crappy spray gun from South Miami."' + "\n\n"
lipsum['doctor'] = 'You picked "Doctor": "I\'m the Doctor. Well, they call me the Doctor. I don\'t know why. I call me the Doctor too. I still don\'t know why."' + "\n\n"
lipsum['dentist'] = 'You picked "Dentist": "We are a friendly team of dentists, online hygienists and receptionists who work together to ensure that you receive the best treatment that you require at a time that suits you."' + "\n\n"
lipsum['err'] = 'Dagnabbit! You\'ve gone an\' forgotten to tell me what sort of filler text you\'ve got a hankerin\' fer. Or... maybe you\'ve just don\' know how to talk to a fine fella\' like me. So I\'ma thinkin\' maybe a bit o\' the standard Lorem Ipsum would do ya fine? Take a gander at this beaut\': "Recusandae laudantium soluta mollitia cumque vel. Et itaque illo optio et quasi facilis tempora. Quam dolores maxime qui velit aliquam. Repudiandae sapiente voluptates sed et et molestias ratione voluptas. Deleniti laborum reiciendis harum."' + "\n\n"

unless lipsum.keys.include? lipsum_wanted
    lipsum_wanted = 'err'
end
lipsum_paragraphs.times do
  lipsum_out += lipsum[lipsum_wanted]
end
puts "\n" + lipsum_options + lipsum_out
system('echo "' + lipsum_out.gsub(/\"/,'\"') + '"| xclip -selection clipboard')

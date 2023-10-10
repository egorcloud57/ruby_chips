# написать регулярное выражение в котором строка такого типа будет подходить ((Hlabla)(#)(AZX_A)(?)(4244)(-)(1213)(-)(2424)(любой символ).)

str = "Steave#_MAN_?9999-2345-1111 ."

def str.login_true?
  serch = /^[A-Z]{1}[a-z1-9]+#[A-Z_]+\?[\d]{4}-[\d]{4}-[\d]{4}[.\s]{1}\.$/.match(self)
  p serch[0]
  if serch
    true
  end
end

p str.login_true?

# Найти весь найденный текст между тегами и сделать ему аперкейс.

text =<<-EOF
<body>
  <h1>This is a heading</h1>
    <p>
      This is a paragraph with some<i>italics</i>and some <b>boldface</b>in it...
    </p>
</body>
EOF

regexp = /
          (?:
           (?<=>)
          )
          ([^<]*)
         /x

p new_txt = text.gsub(regexp){ |el| el.upcase }

# Найти все найденные теги и заменить все внутри на bla.

regexp2 = /
           (?:
            (?<=<)
           )
           ([^>]*)
          /x

p new_txt2 = text.gsub(regexp2){ |el| el = 'bla' }

# Найти все теги
regexp3 = /
           ([^<]*)
           (?:
            (?=>)
           )
          /x

p text.scan(regexp3)
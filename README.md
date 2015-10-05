kor-output-json
===

[![Build Status](https://travis-ci.org/ksss/kor-output-json.svg?branch=master)](https://travis-ci.org/ksss/kor-output-json)

JSON output plugin for kor.

## Usage

```
$ cat table.csv
foo,bar,baz
100,200,300
400,500,600

$ kor csv json < table.csv
{"foo":"100","bar":"200","baz":"300"}
{"foo":"400","bar":"500","baz":"600"}

$ kor csv json --single < table.csv | jq '.'
[
  {
    "foo": "100",
    "bar": "200",
    "baz": "300"
  },
  {
    "foo": "400",
    "bar": "500",
    "baz": "600"
  }
]
```

## Installation

    $ gem install kor-output-json

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/ksss/kor-output-json. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

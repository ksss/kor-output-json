require 'kor/output/json'

module KorOutputJsonTest
  def test_e2e(t)
    actual = `#{<<-COMMAND}`
cat << CSV | kor csv json
foo,bar,baz
100,200,300
400,500,600
700,800,900
CSV
COMMAND
    expect = <<-JSON
{"foo":"100","bar":"200","baz":"300"}
{"foo":"400","bar":"500","baz":"600"}
{"foo":"700","bar":"800","baz":"900"}
JSON
    if actual != expect
      t.error("actual output not match to expect output.")
    end

    actual = `#{<<-COMMAND}`
cat << CSV | kor csv json --single
foo,bar,baz
100,200,300
400,500,600
700,800,900
CSV
COMMAND
    expect = <<-JSON
[{"foo":"100","bar":"200","baz":"300"},{"foo":"400","bar":"500","baz":"600"},{"foo":"700","bar":"800","baz":"900"}]
JSON
    if actual != expect
      t.error("actual output not match to expect output.")
    end
  end
end

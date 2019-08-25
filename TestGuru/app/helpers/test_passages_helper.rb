module TestPassagesHelper
  def color(test_passage)
   if test_passage.success_test?
      'green'
   else
      'red'
   end
  end

 def test_result(test_passage)
   if test_passage.success_test?
     'Test success'
   else
     'Test faild!'
   end
 end
end

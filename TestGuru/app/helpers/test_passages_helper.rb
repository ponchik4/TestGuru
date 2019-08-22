module TestPassagesHelper
  def test_result(test_passage)
   if test_passage.success_test?
     puts 'test_success'
   else
     puts 'test_failed'
   end
 end

 def color(test_passage)
   if test_passage.success_test?
     'block_green'
   else
     'block_red'
   end
 end
end

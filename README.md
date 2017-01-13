== LevelMoney

LevelMoney is a simple script written for a job interview that pulls a users transaction history, aggregates the users spending and income history by month, displays the data to screen.  The --ignore-donuts flag can optionally be used to ignore donut related spending.

Future improvement ideas:
- Use rest-client library instead of calling curl directly.
- Encasulate aggregation data and logic in a Class, rather than a regular Hash.
- Unit Tests.



Sample run with --help flag.

Wills-MBP:LevelMoney will$ ./DisplayUserProfit.rb --help
Usage: DisplayUserProfit.rb [options]
    -i, --ignore-donuts              Disregard all donut-related transactions from the spending.


Sample run with --ignore-donuts flag.

Wills-MBP:LevelMoney will$ ./DisplayUserProfit.rb --ignore-donuts
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100  372k    0  372k  100   170  94716     42  0:00:04  0:00:04 --:--:-- 94729
YYYY-MM	Spent		Income
2014-10	-14941600	34297900
2014-11	-45911100	39495100
2014-12	-46903200	39543200
2015-01	-37567300	39259800
2015-02	-41592000	39366400
2015-03	-33923600	39427300
2015-04	-29397900	39436800
2015-05	-26705600	34164000
2015-06	-37242800	39182300
2015-07	-38981400	39171800
2015-08	-27873900	33848800
2015-09	-30360300	39227200
2015-10	-33018400	17174300
2015-11	-31350300	39777800
2015-12	-31852800	17255700
2016-01	-27460400	22428900
2016-02	-30826900	34513800
2016-03	-42078500	33866100
2016-04	-39043900	39174000
2016-05	-35054000	39911800
2016-06	-32220200	39277800
2016-07	-32027100	39282300
2016-08	-30152800	39223300
2016-09	-36771500	22296300
2016-10	-32402800	22099100
2016-11	-47984600	34418300
2016-12	-30784600	39662500
2017-01	-28365900	0
Average	-34028408	33456521

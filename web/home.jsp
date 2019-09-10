<%--
  Created by IntelliJ IDEA.
  User: Kraiwit
  Date: 24-Aug-19
  Time: 4:20 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>home-หน้าแรก</title>
    <link rel="stylesheet" href="css_home.css">
    <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
          rel="stylesheet">
    <style>
        body{background: #e6e6e6;
        font-family: srinakharinwirot , sans-serif;
        font-size: 1em;
        }

    </style>
</head>
<body>
<!--<img src="./img/header.png" width="100%" style="float: top"/>-->
<!--<img src="./img/layerpost.png " width="100%" style="float: top">
<img src="./img/laayerhome2.png" width="100%" style="float: bottom">
<center><img src="./img/fids.png" width="13%" style="vertical-align: bottom" ></center>
<img src="./img/layerevent.png" width="100%" style="float: bottom"/>
<img src="./img/layeradvie.png" width="100%" style="float: bottom"/>
<img src="./img/layerpostdriver.png" width="100%" style="float: bottom"/>-->

<div class="postBox">
<div align="center">
<form action="">
    <table>
        <tr>
            <td><input type="radio" name="gender" value="male"> Driver        <br></td> <td>Form </td><td><input type="text" name="form"><br></td>
        </tr>
        <tr>
            <td><input type="radio" name="gender" value="female"> Passenger         <br></td><td>To </td><td><input type="text" name="to"></td>
        </tr>
        <tr>
            <td>
                Time  <select>
                <OPTION VALUE=t0>00</OPTION>
                <OPTION VALUE=t1>01</OPTION>
                <OPTION VALUE=t2>02</OPTION>
                <OPTION VALUE=t3>03</OPTION>
                <OPTION VALUE=t4>04</OPTION>
                <OPTION VALUE=t5>05</OPTION>
                <OPTION VALUE=t6>06</OPTION>
                <OPTION VALUE=t7>07</OPTION>
                <OPTION VALUE=t8>08</OPTION>
                <OPTION VALUE=t9>09</OPTION>
                <OPTION VALUE=t10>10</OPTION>
                <OPTION VALUE=t11>11</OPTION>
                <OPTION VALUE=t12>12</OPTION>
                <OPTION VALUE=t13>13</OPTION>
                <OPTION VALUE=t14>14</OPTION>
                <OPTION VALUE=t15>15</OPTION>
                <OPTION VALUE=t16>16</OPTION>
                <OPTION VALUE=t17>17</OPTION>
                <OPTION VALUE=t18>18</OPTION>
                <OPTION VALUE=t19>19</OPTION>
                <OPTION VALUE=t20>20</OPTION>
                <OPTION VALUE=t21>21</OPTION>
                <OPTION VALUE=t22>22</OPTION>
                <OPTION VALUE=t23>23</OPTION>
            </select>
                <select>
                    <OPTION VALUE=tt0>00</OPTION>
                    <OPTION VALUE=tt1>01</OPTION>
                    <OPTION VALUE=tt2>02</OPTION>
                    <OPTION VALUE=tt3>03</OPTION>
                    <OPTION VALUE=tt4>04</OPTION>
                    <OPTION VALUE=tt5>05</OPTION>
                    <OPTION VALUE=tt6>06</OPTION>
                    <OPTION VALUE=tt7>07</OPTION>
                    <OPTION VALUE=tt8>08</OPTION>
                    <OPTION VALUE=tt9>09</OPTION>
                    <OPTION VALUE=tt10>10</OPTION>
                    <OPTION VALUE=tt11>11</OPTION>
                    <OPTION VALUE=tt12>12</OPTION>
                    <OPTION VALUE=tt13>13</OPTION>
                    <OPTION VALUE=tt14>14</OPTION>
                    <OPTION VALUE=tt15>15</OPTION>
                    <OPTION VALUE=tt16>16</OPTION>
                    <OPTION VALUE=tt17>17</OPTION>
                    <OPTION VALUE=tt18>18</OPTION>
                    <OPTION VALUE=tt19>19</OPTION>
                    <OPTION VALUE=tt20>20</OPTION>
                    <OPTION VALUE=tt21>21</OPTION>
                    <OPTION VALUE=tt22>22</OPTION>
                    <OPTION VALUE=tt23>23</OPTION>
                    <OPTION VALUE=tt24>24</OPTION>
                    <OPTION VALUE=tt25>25</OPTION>
                    <OPTION VALUE=tt26>26</OPTION>
                    <OPTION VALUE=tt27>27</OPTION>
                    <OPTION VALUE=tt28>28</OPTION>
                    <OPTION VALUE=tt29>29</OPTION>
                    <OPTION VALUE=tt30>30</OPTION>
                    <OPTION VALUE=tt31>31</OPTION>
                    <OPTION VALUE=tt32>32</OPTION>
                    <OPTION VALUE=tt33>33</OPTION>
                    <OPTION VALUE=tt34>34</OPTION>
                    <OPTION VALUE=tt35>35</OPTION>
                    <OPTION VALUE=tt36>36</OPTION>
                    <OPTION VALUE=tt37>37</OPTION>
                    <OPTION VALUE=tt38>38</OPTION>
                    <OPTION VALUE=tt39>39</OPTION>
                    <OPTION VALUE=tt40>40</OPTION>
                    <OPTION VALUE=tt41>41</OPTION>
                    <OPTION VALUE=tt42>42</OPTION>
                    <OPTION VALUE=tt43>43</OPTION>
                    <OPTION VALUE=tt44>44</OPTION>
                    <OPTION VALUE=tt45>45</OPTION>
                    <OPTION VALUE=tt46>46</OPTION>
                    <OPTION VALUE=tt47>47</OPTION>
                    <OPTION VALUE=tt48>48</OPTION>
                    <OPTION VALUE=tt49>49</OPTION>
                    <OPTION VALUE=tt50>50</OPTION>
                    <OPTION VALUE=tt51>51</OPTION>
                    <OPTION VALUE=tt52>52</OPTION>
                    <OPTION VALUE=tt53>53</OPTION>
                    <OPTION VALUE=tt54>54</OPTION>
                    <OPTION VALUE=tt55>55</OPTION>
                    <OPTION VALUE=tt56>56</OPTION>
                    <OPTION VALUE=tt57>57</OPTION>
                    <OPTION VALUE=tt58>58</OPTION>
                    <OPTION VALUE=tt59>59</OPTION>
                </select>
            </td>
            <td>Date  </td>
            <td>
                <select>
                    <OPTION SELECTED value="">Day</OPTION>
                    <OPTION VALUE=1>1</OPTION>
                    <OPTION VALUE=2>2</OPTION>
                    <OPTION VALUE=3>3</OPTION>
                    <OPTION VALUE=4>4</OPTION>
                    <OPTION VALUE=5>5</OPTION>
                    <OPTION VALUE=6>6</OPTION>
                    <OPTION VALUE=7>7</OPTION>
                    <OPTION VALUE=8>8</OPTION>
                    <OPTION VALUE=9>9</OPTION>
                    <OPTION VALUE=10>10</OPTION>
                    <OPTION VALUE=11>11</OPTION>
                    <OPTION VALUE=12>12</OPTION>
                    <OPTION VALUE=13>13</OPTION>
                    <OPTION VALUE=14>14</OPTION>
                    <OPTION VALUE=15>15</OPTION>
                    <OPTION VALUE=16>16</OPTION>
                    <OPTION VALUE=17>17</OPTION>
                    <OPTION VALUE=18>18</OPTION>
                    <OPTION VALUE=19>19</OPTION>
                    <OPTION VALUE=20>20</OPTION>
                    <OPTION VALUE=21>21</OPTION>
                    <OPTION VALUE=22>22</OPTION>
                    <OPTION VALUE=23>23</OPTION>
                    <OPTION VALUE=24>24</OPTION>
                    <OPTION VALUE=25>25</OPTION>
                    <OPTION VALUE=26>26</OPTION>
                    <OPTION VALUE=27>27</OPTION>
                    <OPTION VALUE=28>28</OPTION>
                    <OPTION VALUE=29>29</OPTION>
                    <OPTION VALUE=30>30</OPTION>
                    <OPTION VALUE=31>31</OPTION>
                </select>
                <select>
                    <OPTION SELECTED value="">Months</OPTION>
                    <OPTION VALUE=January>January</OPTION>
                    <OPTION VALUE=February>February</OPTION>
                    <OPTION VALUE=March>March</OPTION>
                    <OPTION VALUE=April>April</OPTION>
                    <OPTION VALUE=May>May</OPTION>
                    <OPTION VALUE=June>June</OPTION>
                    <OPTION VALUE=July>July</OPTION>
                    <OPTION VALUE=August>August</OPTION>
                    <OPTION VALUE=September>September</OPTION>
                    <OPTION VALUE=October>October</OPTION>
                    <OPTION VALUE=November>November</OPTION>
                    <OPTION VALUE=December>December</OPTION>
                </select>
                <select>
                    <option selected value="">Year</option>
                    <OPTION VALUE=2019>2019</OPTION>
                    <OPTION VALUE=2020>2020</OPTION>
                    <OPTION VALUE=2021>2021</OPTION>
                    <OPTION VALUE=2022>2022</OPTION>
                    <OPTION VALUE=2022>2023</OPTION>
                    <OPTION VALUE=2024>2024</OPTION>
                    <OPTION VALUE=2025>2025</OPTION>
                    <OPTION VALUE=2026>2026</OPTION>
                    <OPTION VALUE=2027>2027</OPTION>
                    <OPTION VALUE=2028>2028</OPTION>
                    <OPTION VALUE=2029>2029</OPTION>
                    <OPTION VALUE=2030>2030</OPTION>
                    <OPTION VALUE=2031>2031</OPTION>
                    <OPTION VALUE=2032>2032</OPTION>
                </select>
            </td>
        </tr>
    </table>
    <div class="btn" align="center">Post</div>
</form>
</div>
</div>

<div class="findsBox" align="center">
    Find places that you will travel<br>
    <input name="keyword" type="text" id="keyword" size="25" />
    <input name="iFind" type="button" id="iFind" value="Find" />
</div>

<div class="evenBox" align="center">
    Travel together on the upcoming events soon <br>
    <img src="./img/event1.png"width="155" height="155"/>
    <img src="./img/event2.jpg"width="155" height="155"/>
    <img src="./img/event3.jpg"width="155" height="155"/>
    <img src="./img/event4.PNG"width="155" height="155"/>
</div>

<div class="box" align="center">
    Introduce the driver<br>
    <div class="container">
        <table>
            <tr>
                <div class="row">
                    <td>
                        <div class="col-12 col-sm-6 col-md-4 col-lg-3">
                            <div class="our-team">
                                <div class="picture">
                                    <img class="img-fluid" src="./img/rating1.jpg">
                                </div>
                                <div class="team-content">
                                    <h3 class="name">Michele Miller</h3>
                                    <h4 class="title">18 Female</h4>
                                </div>
                                <ul class="social">
                                    <p>Profile</p>
                                </ul>
                            </div>
                        </div>
                    </td>

                    <td>
                        <div class="col-12 col-sm-6 col-md-4 col-lg-3">
                            <div class="our-team">
                                <div class="picture">
                                    <img class="img-fluid" src="./img/rating2.jpg">
                                </div>
                                <div class="team-content">
                                    <h3 class="name">Patricia Knott</h3>
                                    <h4 class="title">19 Male</h4>
                                </div>
                                <ul class="social">
                                    <p>Profile</p>
                                </ul>
                            </div>
                        </div>
                    </td>

                    <td>
                        <div class="col-12 col-sm-6 col-md-4 col-lg-3">
                            <div class="our-team">
                                <div class="picture">
                                    <img class="img-fluid" src="./img/rating3.jpg">
                                </div>
                                <div class="team-content">
                                    <h3 class="name">Justin Ramos</h3>
                                    <h4 class="title">18 Male</h4>
                                </div>
                                <ul class="social">
                                    <p>Profile</p>
                                </ul>
                            </div>
                        </div>
                    </td>

                    <td>
                        <div class="col-12 col-sm-6 col-md-4 col-lg-3">
                            <div class="our-team">
                                <div class="picture">
                                    <img class="img-fluid" src="./img/rating4.jpg">
                                </div>
                                <div class="team-content">
                                    <h3 class="name">Mary Huntley</h3>
                                    <h4 class="title">19 Female</h4>
                                </div>
                                <ul class="social">
                                    <p>Profile</p>
                                </ul>
                            </div>
                        </div>
                    </td>

                </div>
            </tr>


        </table>
    </div>
</div>

<div class="postDriverPassengerBox" align="center">
    Post
</div>

<nav>
    <div class="toggle">
        <i class="fa fa-bars menu" aria-hidden="true"></i>
    </div>
    <ul>
        <li><a href="#">Home</a></li>
        <li><a href="driver.jsp">Profile</a>
        <li><a href="#">Chat</a>
        <li><a href="#">Log out</a>
    </ul>
</nav>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script type="text/javascript">
    $(document).ready(function() {
        $('.menu').click(function () {
            $('ul').toggleClass('active');
        })
    })
</script>
</body>
</html>

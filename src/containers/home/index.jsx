import React from "react";
import { useNavigate } from "react-router-dom";
import { Animate } from "react-simple-animate";
import "./styles.scss";
import GcpCe from "../../images/gcp_ce.png"
import GcpDev from "../../images/gcp-dev.png"
import AwsCert from "../../images/aws-cert.png"


const Home = () => {
  const navigate = useNavigate();

  const handleNavigateToContactMePage = () => {
    navigate("/contact");
  };

  return (
    <section id="home" className="home">
      
      <div className="home__text-wrapper">
          <div className="certs-card">
            <img src={GcpCe} width={75} height={75} className="cert-img"/>
            <img src={GcpDev} width={80} height={80} className="cert-img"/>
            <img src={AwsCert} width={80} height={80} className="cert-img"/>
          <h1>
            Hello, I'm Venkata Suresh
            <br />
            Cloud Engineer
          </h1>
          </div>
      </div>
      <Animate
        play
        duration={1.5}
        delay={1}
        start={{
          transform: "translateY(550px)",
        }}
        end={{
          transform: "translatex(0px)",
        }}
      >
        <div className="home__contact-me">
          <button onClick={handleNavigateToContactMePage}>Hire Me</button>
        </div>
      </Animate>
    </section>
  );
};
export default Home;

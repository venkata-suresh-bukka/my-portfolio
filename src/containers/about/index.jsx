import React from "react";
import { BsInfoCircleFill } from "react-icons/bs";
import PageHeaderContent from "../../components/pageHeaderContent";
import { Animate } from "react-simple-animate";
import "./styles.scss";
import { DiApple, DiAndroid } from "react-icons/di";
import { FaDev, FaDatabase } from "react-icons/fa";
import gcpIcon from'../../images/google-cloud-icon.png';
import awsIcon from'../../images/aws.png';
import devOps from'../../images/devops2.png';
import cloudAuto from'../../images/cloud-automation.png';

const personalDetails = [
  {
    label: "Name",
    value: "Venkata Suresh Bukka",
  },
  {
    label: "Age",
    value: "24",
  },
  {
    label: "Address",
    value: "Kakinada,India",
  },
  {
    label: "Email",
    value: "venkatasuresh.bukka@gmail.com",
  },
  {
    label: "Contact No",
    value: "+91 7702664058",
  },
];

const jobSummary =
  "Experienced Cloud Engineer, DevOps and cloud Developer skilled in designing and deploying advanced IT Cloud Infrastructure solutions. Proven automation expertise with a track record of adapting to challenges. Proficient in Google Cloud Platform and AWS, bringing innovation to dynamic environments.";

const About = () => {
  return (
    <section id="about" className="about" style={{backgroundColor:"rgb(78, 84, 88)"}}>
      <PageHeaderContent
        headerText="About Me"
        icon={<BsInfoCircleFill size={40} />}
      />
      <div className="about__content">
        <div className="about__content__personalWrapper">
          <Animate
            play
            duration={1.5}
            delay={1}
            start={{
              transform: "translateX(-900px)",
            }}
            end={{
              transform: "translatex(0px)",
            }}
          >
            <h3>Cloud Engineer,Devops and Automation Engineer</h3>
            <p>{jobSummary}</p>
          </Animate>

          <Animate
            play
            duration={1.5}
            delay={1}
            start={{
              transform: "translateX(500px)",
            }}
            end={{
              transform: "translatex(0px)",
            }}
          >
            <h3 className="personalInformationHeaderText">
              Personal Information
            </h3>
            <ul>
              {personalDetails.map((item, i) => (
                <li key={i}>
                  <span className="title">{item.label}</span>
                  <span className="value">{item.value}</span>
                </li>
              ))}
            </ul>
          </Animate>
        </div>
        <div className="about__content__servicesWrapper">
          <Animate
            play
            duration={1.5}
            delay={1}
            start={{
              transform: "translateX(600px)",
            }}
            end={{
              transform: "translatex(0px)",
            }}
          >
            <div className="about__content__servicesWrapper__innerContent">
              <div>
                <img src={gcpIcon} alt="GCP Icon" style={{ width: 60, height: 60 }} />
              </div>
              <div>
                <img src={awsIcon} alt="GCP Icon" style={{ width: 60, height: 60 }} />
              </div>
              <div>
                <img src={cloudAuto} alt="GCP Icon" style={{ width: 60, height: 80 }} />
              </div>
              <div>
                <img src={devOps} alt="GCP Icon" style={{ width: 140,marginLeft:-40, height: 90 }} />
              </div>
            </div>
          </Animate>
        </div>
      </div>
    </section>
  );
};
export default About;

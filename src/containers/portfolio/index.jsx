import React from "react";
import PageHeaderContent from "../../components/pageHeaderContent";
import { BsInfoCircleFill } from "react-icons/bs";
import GcpVM from "../../images/gcp_vm.png";
import GcpMini from "../../images/gcp_mini.png";
import GcpTf from "../../images/gcp_tf.jpg";
import ImageFour from "../../images/image2.jpg";
import ImageFive from "../../images/image5.jpg";
import GcpEasy from "../../images/gcp_easy.png";
import Books from "../../images/books.jpg";
import FoodSite from "../../images/food-site.png";
import GcpCe from "../../images/gcp_ce.png"
import AwsCert from "../../images/aws-cert.png"
import GcpDev from "../../images/gcp-dev.png"


import "./styles.scss";
import { useState } from "react";

const portfolioData = [
  {
    id: 2,
    name: "Gcp Easy Dashboard",
    image: GcpEasy,
    link: "https://github.com/venkata-suresh-bukka/gcp-easy-dashboard/tree/dev",
  },
  {
    id: 2,
    name: "Gcp VM Reporting",
    link: "https://github.com/venkata-suresh-bukka/gcp-vm-reporting/tree/dev",
    image: GcpVM,
  },
  {
    id: 2,
    name: "Gcp Mini Projects",
    image: GcpMini,
    link: "https://github.com/venkata-suresh-bukka/gcp-mini-projects/tree/dev",
  },
  {
    id: 2,
    name: "Gcp Assets TF Modules",
    image: GcpTf,
    link: "https://github.com/venkata-suresh-bukka/gcp-assets-terraform-modules/tree/dev",
  },
  {
    id: 2,
    name: "Django Social Auth",
    image: ImageFour,
    link: "https://github.com/venkata-suresh-bukka/django-social-auth/tree/dev",
  },
  {
    id: 2,
    name: "Food Site App",
    image: FoodSite,
    link: "https://github.com/venkata-suresh-bukka/flask-food-site/tree/dev",
  },
  {
    id: 2,
    name: "Book Inventory App",
    image: Books,
    link: "https://github.com/venkata-suresh-bukka/books_inventory_flask",
  },
  {
    id: 4,
    name: "Certification 1",
  },
  {
    id: 4,
    name: "Certification 2",
  },
  // {
  //   id: 3,
  //   name: "Champ Award FY23, Q4",
  //   image: Champ1,
  //   link: "https://github.com/venkata-suresh-bukka/books_inventory_flask",
  // },
  // {
  //   id: 3,
  //   name: "Champ Award FY24, Q2",
  //   image: Champ2,
  //   link: "https://github.com/venkata-suresh-bukka/books_inventory_flask",
  // },
  // {
  //   id: 3,
  //   name: "Sapphire Award 1",
  //   image: Sapphire1,
  //   link: "https://github.com/venkata-suresh-bukka/books_inventory_flask",
  // },
  // {
  //   id: 3,
  //   name: "Sapphire Award 2",
  //   image: Sapphire2,
  //   link: "https://github.com/venkata-suresh-bukka/books_inventory_flask",
  // },
  // {
  //   id: 3,
  //   name: "Sapphire Award 3",
  //   image: Sapphire3,
  //   link: "https://github.com/venkata-suresh-bukka/books_inventory_flask",
  // },
  // {
  //   id: 3,
  //   name: "Emerald Award 1",
  //   image: Emerald1,
  //   link: "https://github.com/venkata-suresh-bukka/books_inventory_flask",
  // },
  // {
  //   id: 3,
  //   name: "Emerald Award 2",
  //   image: Emerald2,
  //   link: "https://github.com/venkata-suresh-bukka/books_inventory_flask",
  // },
];
const filterData = [
  {
    filterId: 2,
    label: "My Projects",
  },
  {
    filterId: 3,
    label: "Recognition",
  },
  {
    filterId: 4,
    label: "Certifications",
  },
];

const Portfolio = () => {
  const [filteredvalue, setFilteredValue] = useState(2); // Default to projects
  const [hoveredValue, setHoveredValue] = useState(null);

  function handleFilter(currentId) {
    setFilteredValue(currentId);
  }

  function handleHover(index) {
    setHoveredValue(index);
  }

  const filteredItems =
  filteredvalue === 2
    ? portfolioData.filter((item) => item.id === 2)
    : portfolioData.filter((item) => item.id === 3);

  console.log("====================================");
  console.log(hoveredValue);
  console.log("====================================");

  console.log(filteredItems);
  function handleVisit(item) {
    if (item.link) {
      window.location.href = item.link;
    }
  }

  return (
    <section id="portfolio" className="portfolio">
      <PageHeaderContent
        headerText="My Portfolio"
        icon={<BsInfoCircleFill size={40} />}
      />
      <div className="portfolio__content">
        <ul className="portfolio__content__filter">
          {filterData.map((item) => (
            <li
              className={item.filterId === filteredvalue ? "active" : ""}
              onClick={() => handleFilter(item.filterId)}
              key={item.filterId}
            >
              {item.label}
            </li>
          ))}
        </ul>
        <div className="portfolio__content__cards">
          {filteredItems.map((item, index) => (
            <div
              className="portfolio__content__cards__item"
              key={`cardItem${item.name.trim()}`}
              onMouseEnter={() => handleHover(index)}
              onMouseLeave={() => handleHover(null)}
            >
              {filteredvalue === 2 && (
                <>
                  <div className="portfolio__content__cards__item__img-wrapper">
                    <a>
                      <img alt="dummy data" src={item.image} />
                    </a>
                  </div>
                  <div className="overlay">
                    {index === hoveredValue && (
                      <div>
                        <p>{item.name}</p>
                        <button onClick={() => handleVisit(item)}>Visit</button>
                      </div>
                    )}
                  </div>
                </>
              )}
            </div>
          ))}
        </div>

        {filteredvalue === 3 && (
          <div className="awards-list">
            <h1 className="">Awards and Recognitions</h1>
            <ul className="awards-ul">
                <li>Earned multiple <span className='champ'>Emerald & Sapphire</span> recognitions for proactive contributions to collaborative learning, elevating team skillsets, and showcasing remarkable troubleshooting skills. Recognized by our <span className="champ">cloud lead</span>  for consistent and impactful work in unfamiliar domains, expanding team capabilities.</li> 
                <li>Have received <span className="champ">Sapphire </span> 
                  recognitions from senior team members for rapid learning and effective solution delivery.
                </li> 
                <li>Awarded the <span className="champ">FY23, Q4 DXC Champ award for
                  </span> -- <span className="champ"> eXcellence</span>, acknowledging adept management of deliverables and unwavering support to the team.
                </li>
                <li>Secured the  <span className="champ">FY24, Q2 DXC Champ award for</span> -- <span className="champ">eXcellence</span>, recognized for valuable contributions in automations and demonstrated technical expertise.</li>           
                <li>Attained <span className="champ">Six Sigma Yellow Belt</span> certification and featured in a success story publication for our automation achievements in AWS.</li>
            </ul>
          </div>
        )}

      {filteredvalue === 4 && (  
        <div className="certifications-list">
          <h1>Certifications</h1>
          <div className="certifications-content">
            <div className="certification-item">
              <a href="https://google.accredible.com/ea70c312-93a9-4f2a-a233-21f40277a61e">
                <img src={GcpCe} width={90} alt="GCP Cloud Engineer" className="certification-image" />
                <span className="hover-text">GCP Cloud Engineer</span>
              </a>
            </div>
            <div className="certification-item">
              <a href="https://www.credential.net/3086b678-37da-4789-aadd-0eea10997e18?key=c386c5fe2e7709b43a9e2a42a3bb806153428b58854cfe9f1f49de174c89e2d2">
                <img src={GcpDev} width={96} alt="GCP Cloud Developer" className="certification-image" />
                <span className="hover-text">GCP Cloud Developer</span>
              </a>
            </div>
            <div className="certification-item">
              <a href="https://www.credly.com/badges/e005b9af-02cc-4ffe-aca8-0bfd8bbc9429">
                <img src={AwsCert} width={90} alt="AWS Certified" className="certification-image" />
                <span className="hover-text">AWS Certified</span>
              </a>
            </div>
          </div>
        </div>
      )}
      </div>
    </section>
  );
};

export default Portfolio;
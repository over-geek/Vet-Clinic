<a name="readme-top"><h1 align="center">VET CLINIC DATABASE</h1></a>

<!-- TABLE OF CONTENTS -->

# 📗 Table of Contents

- [📖 About the Project](#about-project)
  - [🛠 Built With](#built-with)
    - [Tech Stack](#tech-stack)
    - [Key Features](#key-features)
- [💻 Getting Started](#getting-started)
  - [Setup](#setup)
  - [Prerequisites](#prerequisites)
  - [Install](#install)
  - [Usage](#usage)
  - [Run tests](#run-tests)
  - [Deployment](#triangular_flag_on_post-deployment)
- [👥 Authors](#authors)
- [🔭 Future Features](#future-features)
- [🤝 Contributing](#contributing)
- [⭐️ Show your support](#support)
- [🙏 Acknowledgements](#acknowledgements)
- [❓ FAQ](#faq)
- [📝 License](#license)

<!-- PROJECT DESCRIPTION -->

# 📖 Vet Clinic Database <a name="about-project"></a>

Vet Clinic Database is relational database creates initial data structure for a vet clinic. It also has a table that store animals' information, insert some data into it, and query it.

## 🛠 Built With <a name="built-with"></a>

### Tech Stack <a name="tech-stack"></a>

<details>
  <summary>Client</summary>
  <ul>
    <li><a href="https://reactjs.org/">React.js</a></li>
  </ul>
</details>

<details>
  <summary>Server</summary>
  <ul>
    <li><a href="https://expressjs.com/">Express.js</a></li>
  </ul>
</details>

<details>
<summary>Database</summary>
  <ul>
    <li><a href="https://www.postgresql.org/">PostgreSQL</a></li>
  </ul>
</details>

<!-- Features -->

### Key Features <a name="key-features"></a>

- vet_clinic Database
- Create a table named `animals`
- Data stored in the database are `id`, `name`, `date of birth`, `weight`, `escape attempts` and `neutered`.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- GETTING STARTED -->

## 💻 Getting Started <a name="getting-started"></a>

To get a local copy up and running, follow these steps.

### Prerequisites

In order to run this project, you must have installed and configured the following tools in your local environment:

- [ ] PostgreSQL

### Setup

**You must ensure that you have the postgreSQL installed and the server is started before continuing.**

First clone this repository to your desired folder:

```sh
  git clone https://github.com/over-geek/Vet-Clinic.git
```

Now, you need to create a database called **vet_clinic**.

### Usage

In the command line, execute the following commands one by one in the same order as below:

Note: On all commands, you must replace the `username` with your database's username and `path/to/the/project-folder/` with the path to the project folder in your local environment.

```sh
  psql -U username -d vet_clinic -f path/to/the/project-folder/schema.sql;
```
Running the above command will create a table named **animals** within it.

```sh
  psql -U username -d vet_clinic -f path/to/the/project-folder/data.sql
```
Running the above command will insert four new records into the animals table.

```sh
  psql -U username -d vet_clinic -f path/to/the/project-folder/queries.sql
```
When executing the above command, a series of queries will be made to the animals table.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- AUTHORS -->

## 👥 Authors <a name="authors"></a>

👤 **Agyare Kissi Kenneth Kwame**

- GitHub: [@githubhandle](https://github.com/over-geek)
- Twitter: [@twitterhandle](https://twitter.com/KissiKenneth)
- LinkedIn: [LinkedIn](https://www.linkedin.com/in/kenneth-agyare-kissi-673a01186/)

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- FUTURE FEATURES -->

## 🔭 Future Features <a name="future-features"></a>

- Update animals table
- Query multiple tables.
- Add "join table" for visits

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- CONTRIBUTING -->

## 🤝 Contributing <a name="contributing"></a>

Contributions, issues, and feature requests are welcome!

Feel free to check the [issues page](../../issues/).

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- SUPPORT -->

## ⭐️ Show your support <a name="support"></a>

If you liked this project, give me a "Star" (clicking the star button at the beginning of this page), share this repo with your developer community or make your contributions.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- ACKNOWLEDGEMENTS -->

## 🙏 Acknowledgments <a name="acknowledgements"></a>

I would like to thank [Microverse](https://github.com/microverseinc) for this project

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- LICENSE -->

## 📝 License <a name="license"></a>

This project is [MIT](./LICENSE) licensed.

_NOTE: we recommend using the [MIT license](https://choosealicense.com/licenses/mit/) - you can set it up quickly by [using templates available on GitHub](https://docs.github.com/en/communities/setting-up-your-project-for-healthy-contributions/adding-a-license-to-a-repository). You can also use [any other license](https://choosealicense.com/licenses/) if you wish._

<p align="right">(<a href="#readme-top">back to top</a>)</p>
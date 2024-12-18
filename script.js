require('dotenv').config(); // Load .env file

const dbPassword = process.env.DB_PASSWORD; // Access the password

var neo4j = require('neo4j-driver');
(async () => {
  // URI examples: 'neo4j://localhost', 'neo4j+s://xxx.databases.neo4j.io'
  const URI = 'neo4j+s://0ceece16.databases.neo4j.io'
  const USER = 'neo4j'
  const PASSWORD = process.env.DB_PASSWORD
  let driver

  try {
    driver = neo4j.driver(URI, neo4j.auth.basic(USER, PASSWORD))
    const serverInfo = await driver.getServerInfo()
    console.log('Connection established')
    console.log(serverInfo)
  } catch(err) {
    console.log(`Connection error\n${err}\nCause: ${err.cause}`)
  }
})();

fetch('data.json')
    .then(response => response.json())
    .then(data => {
        const nodes = data.nodes;
        const links = data.links;

        const width = window.innerWidth, height = window.innerHeight;

        const svg = d3.select("svg")
            .attr("width", width)
            .attr("height", height);

        const simulation = d3.forceSimulation(nodes)
            .force("link", d3.forceLink(links).id(d => d.id).distance(150)) // Set the distance between linked nodes
            .force("charge", d3.forceManyBody().strength(-300)) // Control repulsion strength
            .force("center", d3.forceCenter(width / 2, height / 2));

        const link = svg.selectAll(".link")
            .data(links)
            .enter().append("line")
            .attr("class", "link")
            .attr("stroke", "#999");

        const node = svg.selectAll(".node")
            .data(nodes)
            .enter().append("circle")
            .attr("class", "node")
            .attr("r", 20)
            .attr("fill", "steelblue")
            .call(d3.drag()
                .on("start", dragstart)
                .on("drag", dragged)
                .on("end", dragend));

        simulation.on("tick", () => {
            link
                .attr("x1", d => d.source.x)
                .attr("y1", d => d.source.y)
                .attr("x2", d => d.target.x)
                .attr("y2", d => d.target.y);

            node
                .attr("cx", d => d.x)
                .attr("cy", d => d.y);
        });

        function dragstart(event) {
            if (!event.active) simulation.alphaTarget(0.3).restart();
            event.subject.fx = event.subject.x;
            event.subject.fy = event.subject.y;
        }

        function dragged(event) {
            event.subject.fx = event.x;
            event.subject.fy = event.y;
        }

        function dragend(event) {
            if (!event.active) simulation.alphaTarget(0);
            event.subject.fx = null;
            event.subject.fy = null;
        }
    })
    .catch(error => console.error("Error loading data.json:", error));

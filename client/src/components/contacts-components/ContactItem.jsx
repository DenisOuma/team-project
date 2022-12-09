import React, { useContext } from "react";
import PropTypes from "prop-types";
import ContactContext from "../../context/contact/contactContext";
import AttachEmailOutlinedIcon from "@mui/icons-material/AttachEmailOutlined";
import SettingsPhoneOutlinedIcon from "@mui/icons-material/SettingsPhoneOutlined";
import DeleteSweepRoundedIcon from "@mui/icons-material/DeleteSweepRounded";

function ContactItem({ contact }) {
	const contactContext = useContext(ContactContext);
	const { deleteContact, setCurrentContact, clearContact } = contactContext;
	const { id, name, email, phone, contact_type } = contact;

	console.log("here is the contact".contact);

	const onDelete = () => {
		deleteContact(id);
		clearContact();
	};

	return (
		<div className="card bg-light">
			<h3 className="text-primary text-left">
				{name}{" "}
				<span
					style={{ float: "right" }}
					className={
						"badge " +
						(contact_type === "professional"
							? "badge-success"
							: "badge-primary")
					}
				>
					{contact_type === ""
						? null
						: contact_type.charAt(0).toUpperCase() + contact_type.slice(1)}
				</span>
			</h3>

			<ul className="list">
				{email && (
					<li>
						<AttachEmailOutlinedIcon fontSize="small" className="icon-style" />{" "}
						{email}
					</li>
				)}
				{phone && (
					<li>
						<SettingsPhoneOutlinedIcon
							fontSize="small"
							className="icon-style"
						/>{" "}
						{phone}
					</li>
				)}
			</ul>
			<p className="delete-update">
				<button
					className="btn btn-dark btn-sm"
					onClick={() => setCurrentContact(contact)}
				>
					Edit
				</button>
				<span>
					<button className="btn btn-sm" onClick={onDelete}>
						<DeleteSweepRoundedIcon className="delete-icon" />
					</button>
				</span>
			</p>
		</div>
	);
}

ContactItem.propTypes = {
	contact: PropTypes.object.isRequired,
};

export default ContactItem;
